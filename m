Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 443C0C433ED
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Apr 2021 15:10:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0A53C613B1
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Apr 2021 15:10:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237774AbhDEPKl (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Apr 2021 11:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbhDEPKk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Apr 2021 11:10:40 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E49AC061756
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Apr 2021 08:10:34 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id i3so11906821oik.7
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Apr 2021 08:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HPf6aCH8QPpzXPXdzwxpkwYUjyYqA2WigD5dC7RAK7M=;
        b=g3iNGe5eJgSyIvzqU/XPvf6nv1G/aOgXrjyrS2MlS1DAz9bHmhxtxAphWvLS4K3t3d
         rJcGLCdjK1gPnG5HnXqyB9ccVi/P+ftCYOZb3lnF4gUZR96JPiEbe8bEWvVKYo9EQtd+
         YQo5waNEyHOdwtd4UkNs8xnaPjwbTDdmBDmRcY1Ik7DVRgnas4/LZFqN40ItbqZFWM+K
         +xFoyCABS64A5sm29Atg3cTdYc3pj1/KiZ3KqyBXsOyDJse2mcBvL7yvsqCK8x6RFKh8
         GQzHIv8l/bwaQGGX+lXwxAK4Bp7s51bRo1oI1IknAibpLHZ3GNoGxpOTmldOB2puoRRh
         qbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HPf6aCH8QPpzXPXdzwxpkwYUjyYqA2WigD5dC7RAK7M=;
        b=PWNPOcy3Mqfh7Z3yV2somVUQl1Fmg8ZHZ0NZBSPrF3FbOvJfBecMeranL6lx+bTEUk
         x6IkVuFaFuX8kLGT17WAZ9tkS7RTjaHz58FAyxwysavUOYL7ebi+DnbuizIBazn5/hcb
         g4yLYmuitWz5Vg05a+2NiC3+BK8YOgMWfp/pAZbkS9/pbByVKsd+3HUvlDuxd8QE9YGf
         XhTK0XXU+zemoK9xFz6+eL2/MjQljMdcWKoPMu4Xmie1gSK/M32OEJQP1Cy8ZDbVlHkO
         yc54K+tJEnKXqBydN8vDh8yluPICl26sNfhedHOFJCv6J4lzk1F0ez7tU88GQPig2rBW
         30GQ==
X-Gm-Message-State: AOAM532DLI5pYUhAyd+XoiG1fQlShUhW8h6eUfQZvfkk3NzS0gICjWfg
        un23rjQUQ0cDFG0jbY0D45K9b7MqKa0=
X-Google-Smtp-Source: ABdhPJzobNfsvYzt0736+2BIb96yCExtWdXXFJ8sb2CTNBw6/MT8g63MjC4iFUMkJHrHFMHlLGzqvg==
X-Received: by 2002:a05:6808:e:: with SMTP id u14mr18477086oic.130.1617635433589;
        Mon, 05 Apr 2021 08:10:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y11sm3517283oov.9.2021.04.05.08.10.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Apr 2021 08:10:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH] lm63: Added thermal zone support
To:     Azat Gismatov <gismatov.az@mail.ru>, jdelvare@suse.com
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>, linux-hwmon@vger.kernel.org
References: <20210405125522.2814-1-gismatov.az@mail.ru>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <96bb9c86-8a90-c82d-8b86-05e49f04a2ca@roeck-us.net>
Date:   Mon, 5 Apr 2021 08:10:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210405125522.2814-1-gismatov.az@mail.ru>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 4/5/21 5:55 AM, Azat Gismatov wrote:
> There are target systems where temperature sensor in the lm63
> is not the only temperature sensor in the system used to make
> thermal decisions. For example temperature sensors aren't
> connected to the lm63 (sensors are part of CPU and supported
> by own linux driver). 

The last sentence above can be removed. Or replace it all with
something like

"On some systems, temperature sensors not connected to the LM63
are used to make thermal decisions."

  So automatic fan control by the lm63 chip
> doesn't work for that systems.
> Using of thermal zone is much more convenient for embedded
> systems, than fan-control, or any other userspace software,
> because It allow to get smaller software footprint. Also with
> thermal zone we can store all cooling settings in devicetree,
> which is easier to maintain for embedded systems, than some
> userspace software.
> Added support to use manual pwm mode by  property  in device
> tree "#pwm-cells" (#pwm-cells = <2>). This property checkes

checks

> the presence of a pwm chip. If the property is set in the
> device tree, we will use the manual pwm mode by default. From
> the user mode it will not be possible to change automatical

change to automatic mode

> mode in the sysfs attributes. So pwm_chip_add () is used. In
> the device tree lable pwm_fan is used as a cooling device,

label

> it has a "pwms" property in description which is a link to
> the pwm device label. Driver pwm-fan registers thermal_zone
> cooling device.
> Example lm96163, pwm-fan device tree:
> pwm: lm96163@4c {
> 	compatible = "national,lm96163";
> 	reg = <0x4c>;
> 	#pwm-cells = <2>;
> 	/* 0 - one sensor, 1 - many sensors */
> 	#thermal-sensor-cells = <1>;
> };

This would need to be documented.

> fan: pwm_fan {
> 	compatible = "pwm-fan";
> 	/* arg 0 - pwm chip; arg 1 - pwm_id; arg 2 - period*/
> 	pwms = <&pwm 0 100>;
> 	#cooling-cells = <2>;
> 	cooling-levels = <0 25 128 255>;
> };
> 

This seems like an odd and unusual way to register a cooling device,
and it doesn't really explain why the lm63 driver doesn't register
itself as cooling device directly. This is true even more since it
requires that both CONFIG_PWM _and_ SENSORS_PWM_FAN have to be enabled,
which directly conflicts with the notion of limiting code size.
I don't see a technical reason for the current implementation.

Either case, new properties and their use needs to be documented in
Documentation/devicetree/bindings/hwmon/lm63.yaml.

> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-hwmon@vger.kernel.org
> Signed-off-by: Azat Gismatov <gismatov.az@mail.ru>

Is that a new submission or a resubmit or a new version of a previous
patch ? I can't tell. Please explain. If it is a new version of a
previous patch, please version your patches and provide change logs.

> ---
>  drivers/hwmon/lm63.c | 121 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 120 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm63.c b/drivers/hwmon/lm63.c
> index 50f67265c71d..7d685cc4c0bc 100644
> --- a/drivers/hwmon/lm63.c
> +++ b/drivers/hwmon/lm63.c
> @@ -34,7 +34,9 @@
>  #include <linux/err.h>
>  #include <linux/mutex.h>
>  #include <linux/of_device.h>
> +#include <linux/pwm.h>
>  #include <linux/sysfs.h>
> +#include <linux/thermal.h>
>  #include <linux/types.h>
>  
>  /*
> @@ -97,6 +99,8 @@ static const unsigned short normal_i2c[] = { 0x18, 0x4c, 0x4e, I2C_CLIENT_END };
>  #define LM63_MAX_CONVRATE_HZ		32
>  #define LM96163_MAX_CONVRATE_HZ		26
>  
> +#define MAX_SENSORS	2
> +
>  /*
>   * Conversions and various macros
>   * For tachometer counts, the LM63 uses 16-bit values.
> @@ -131,6 +135,12 @@ static const unsigned short normal_i2c[] = { 0x18, 0x4c, 0x4e, I2C_CLIENT_END };
>  
>  enum chips { lm63, lm64, lm96163 };
>  
> +struct lm63_thermal_sensor {
> +	struct lm63_data *data;

This should not be needed. Something like

#define to_lm63_data(s, i)     container_of((s), struct lm63_data, thermal_sensor[i])

and

struct lm63_data *lm63_data = to_lm63_data(thermal_sensor,
                                           thermal_sensor->sensor_id);

should do.

> +	struct thermal_zone_device *tz;
> +	unsigned int sensor_id;
> +};
> +
>  /*
>   * Client data (each client gets its own)
>   */
> @@ -173,8 +183,15 @@ struct lm63_data {
>  	bool lut_temp_highres;
>  	bool remote_unsigned; /* true if unsigned remote upper limits */
>  	bool trutherm;
> +	struct pwm_chip chip;
> +	struct lm63_thermal_sensor thermal_sensor[MAX_SENSORS];
>  };
>  
> +static inline struct lm63_data *to_pwm(struct pwm_chip *chip)
> +{
> +	return container_of(chip, struct lm63_data, chip);
> +}
> +
>  static inline int temp8_from_reg(struct lm63_data *data, int nr)
>  {
>  	if (data->remote_unsigned)
> @@ -421,6 +438,9 @@ static ssize_t pwm1_enable_store(struct device *dev,
>  	unsigned long val;
>  	int err;
>  
> +	if (of_get_property(dev->of_node, "#pwm-cells", NULL))
> +		return -EPERM;
> +
>  	err = kstrtoul(buf, 10, &val);
>  	if (err)
>  		return err;
> @@ -1018,6 +1038,8 @@ static void lm63_init_client(struct lm63_data *data)
>  	u8 convrate;
>  
>  	data->config = i2c_smbus_read_byte_data(client, LM63_REG_CONFIG1);
> +	if (of_get_property(dev->of_node, "#pwm-cells", NULL))
> +		i2c_smbus_write_byte_data(client, LM63_REG_CONFIG_FAN, 0x20);
>  	data->config_fan = i2c_smbus_read_byte_data(client,
>  						    LM63_REG_CONFIG_FAN);
>  
> @@ -1087,6 +1109,96 @@ static void lm63_init_client(struct lm63_data *data)
>  		(data->config_fan & 0x20) ? "manual" : "auto");
>  }
>  
> +static int lm63_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +				const struct pwm_state *state)
> +{
> +	struct lm63_data *data = to_pwm(chip);
> +	struct i2c_client *client = data->client;
> +	int ret = -EINVAL;
> +	u8 pwm_mode;
> +	u8 val;
> +
> +	mutex_lock(&data->update_lock);
> +	pwm_mode = i2c_smbus_read_byte_data(client, LM63_REG_CONFIG_FAN);
> +	if (!(pwm_mode >> 5)) {
> +		mutex_unlock(&data->update_lock);
> +		return -EPERM;
> +	}
> +
> +	if (state->period > 1) {
> +		val = state->duty_cycle * 255 / (state->period - 1);
> +		val = clamp_val(val, 0, 255);
> +		val = data->pwm_highres ? val :
> +				(val * data->pwm1_freq * 2 + 127) / 255;
> +		ret = i2c_smbus_write_byte_data(client, LM63_REG_PWM_VALUE, val);
> +	}
> +
> +	mutex_unlock(&data->update_lock);
> +	return ret;
> +}
> +
> +static const struct pwm_ops lm63_pwm_ops = {
> +	.apply = lm63_pwm_apply,
> +	.owner = THIS_MODULE,
> +};
> +
> +static void lm63_pwm_remove(void *arg)
> +{
> +	struct lm63_data *data = arg;
> +
> +	pwmchip_remove(&data->chip);
> +}
> +
> +static void lm63_init_pwm(struct lm63_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	int ret;
> +
> +	/* Initialize chip */
> +
> +	data->chip.dev = &client->dev;
> +	data->chip.ops = &lm63_pwm_ops;
> +	data->chip.base = -1;
> +	data->chip.npwm = 1;
> +
> +	ret = pwmchip_add(&data->chip);
> +	if (ret < 0) {
> +		dev_warn(&client->dev, "pwmchip_add() failed: %d\n", ret);
> +		return;
> +	}
> +
> +	devm_add_action_or_reset(&client->dev, lm63_pwm_remove, data);
> +}
> +
> +static int lm63_get_temp(void *data, int *temp)
> +{
> +	struct lm63_thermal_sensor *thermal_sensor = data;
> +
> +	*temp = i2c_smbus_read_byte_data(thermal_sensor->data->client,
> +			LM63_REG_LOCAL_TEMP + thermal_sensor->sensor_id) * 1000;
> +
> +	return 0;
> +}
> +
> +static const struct thermal_zone_of_device_ops lm63_tz_ops = {
> +	.get_temp = lm63_get_temp,
> +};
> +
> +static void lm63_init_thermal(struct lm63_data *data)
> +{
> +	struct i2c_client *client = data->client;
> +	struct lm63_thermal_sensor *thermal_sensor;
> +	unsigned int i;
> +
> +	thermal_sensor = data->thermal_sensor;
> +	for (i = 0; i < MAX_SENSORS; i++, thermal_sensor++) {
> +		thermal_sensor->data = data;
> +		thermal_sensor->sensor_id = i;
> +		thermal_sensor->tz = devm_thermal_zone_of_sensor_register(&client->dev,
> +						 i, thermal_sensor, &lm63_tz_ops);
> +	}
> +}
> +
>  static const struct i2c_device_id lm63_id[];
>  
>  static int lm63_probe(struct i2c_client *client)
> @@ -1126,7 +1238,14 @@ static int lm63_probe(struct i2c_client *client)
>  
>  	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
>  							   data, data->groups);
> -	return PTR_ERR_OR_ZERO(hwmon_dev);
> +	if (IS_ERR(hwmon_dev))
> +		return PTR_ERR(hwmon_dev);
> +
> +	lm63_init_thermal(data);
> +	if (IS_ENABLED(CONFIG_PWM))
> +		lm63_init_pwm(data);
> +
> +	return 0;
>  }
>  
>  /*
> 

