***Defining a BMI for everyone based on age, gender, urban/rural, inactivity and diet;

***Age and gender already defined in the model;

***Urban/rural - quite a wide range of urban pop but on average 45% in SSA is urban;
*Source: https://data.worldbank.org/indicator/SP.URB.TOTL.IN.ZS?locations=ZG&name_desc=false;

prob_urban = 0.40 + (rand('uniform')*0.20);
a=rand('uniform');
urban=0; if a < prob_urban then urban=1;

***Physical activity;
a=rand('uniform');
        
        /* 2. LIFESTYLE & DIET RISK FACTORS */
        /* Physical Activity: Low, Moderate, High */
        pa_rand = ranuni(0);
        if setting = 'Urban' then do;
            if pa_rand < 0.50 then phys_activity = 'Low';
            else if pa_rand < 0.85 then phys_activity = 'Moderate';
            else phys_activity = 'High';
        end;
        else do; /* Rural populations tend to have higher physical activity */
            if pa_rand < 0.15 then phys_activity = 'Low';
            else if pa_rand < 0.45 then phys_activity = 'Moderate';
            else phys_activity = 'High';
        end;
        
        /* Diet: Portions of fruit per day (Poisson-like distribution, mean ~ 1.5) */
        fruit_portions = floor(rand('POISSON', 1.5));
        if fruit_portions > 5 then fruit_portions = 5; /* cap at realistic max */

        /* 3. BASELINE MEAN & VARIANCE MODULATION */
        /* Start with base population anchors */
        if gender = 'Female' then base_mu = 62.0; 
        else base_mu = 58.0;
        
        base_var = 50.0;
        
        /* Adjust Mean based on Setting */
        if setting = 'Urban' then base_mu = base_mu + 6.0;
        
        /* Adjust Mean based on Age (Peak weight accumulation between ages 40-60) */
        if age between 35 and 55 then base_mu = base_mu + 4.0;
        else if age > 55 then base_mu = base_mu + 2.0;
        else base_mu = base_mu - 3.0; /* Younger adults */
        
        /* Adjust Mean based on Physical Activity */
        if phys_activity = 'Low' then do;
            base_mu = base_mu + 5.0;
            base_var = base_var + 25.0; /* wider spread for sedentary groups */
        end;
        else if phys_activity = 'High' then base_mu = base_mu - 4.0;
        
        /* Adjust Mean based on Diet (Fruit intake as a health-conscious/SES proxy) */
        if fruit_portions >= 3 then base_mu = base_mu - 1.5; /* slightly leaner profile */
        
        /* Ensure biological floor constraint */
        if base_mu < 40.0 then base_mu = 40.0;

        /* 4. CONVERT TO GAMMA PARAMETERS (Shape & Scale) */
        /* alpha (shape) = mu^2 / variance */
        alpha = (base_mu**2) / base_var;
        /* scale = variance / mu */
        scale = base_var / base_mu;
        
        /* 5. GENERATE FINAL WEIGHT */
        weight = rand('GAMMA', alpha) * scale;
        
        output;
    end;
end;
run;

/* Verify distributions across risk strata */
proc means data=agents mean std min max maxdec=1;
    class gender setting phys_activity;
    var weight age fruit_portions;
run;
