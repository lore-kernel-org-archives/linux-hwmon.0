Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54938C4332F
	for <linux-hwmon@archiver.kernel.org>; Mon,  7 Feb 2022 11:59:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359443AbiBGLsn (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 7 Feb 2022 06:48:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235431AbiBGLKu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 7 Feb 2022 06:10:50 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A8B0C0401C1
        for <linux-hwmon@vger.kernel.org>; Mon,  7 Feb 2022 03:10:49 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id s13so40911262ejy.3
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Feb 2022 03:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Es77KzUtF7a9urkkZUn1b9TI5X99t4/B9e5Zsi6qnFA=;
        b=hXjDtRViDfQTF+GQZTxnf1dhgx/DQMWSJX1IC+XDuGtwqEuciA68/g1Ws0q1Dn4Usp
         7WX7uOllSdJ//8TgNy2FiiqY0W4dMxifHVFT8Jy9GsBwjQDHaMKkAmwbhl+sFB2azSc+
         54kW3LRMpvUPxKciKri15uLeqbCXOFrs0rvUK1h6CRNY/Hnq0a4+fU5jMpxIUx7hu8gx
         OQYwvkSCgA/SQlItuZ2lYROBycL106Ed+64PhtCRVqx3u2torSlN6qkvJ6CFY3vp9o/O
         rmJ9A6bocqAXy7TTmwN1CpCjePq9MPhBNRjxlWCxsgvvrsDtBdw2w2rZVW/8i1+fqiP3
         NCaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Es77KzUtF7a9urkkZUn1b9TI5X99t4/B9e5Zsi6qnFA=;
        b=oeyUS9ab8zYSLoaXCL8UW4l0GU7LbpZxNUL1mHijXqh7dRVCild+2LtAdxu9Ha1QB4
         SpaJ/f4Hlraehegw5h5zZwfBieDt5IKvO60tA2AB8pd7ky14R8EI2RjT4j6nJUU8oPhG
         /Y7zMItzSmck+hSXksKGj8lr2g44OH9wFhMXDKlc9i2S6Te2vYPMpmz+uJMmnktJBpSw
         7B3ElY8ULvv48iEbR1aK3suVGpGFFpVy5pab8j4Tsog7cMxYWNN0N1j3Amb+152K7VFC
         vct4gbpDkv4FzGttHPFPpH/jSr1YrkZLXBT64mSeUOyauovF7HWHf8Lta4mmn/jkbW5Z
         ZAMg==
X-Gm-Message-State: AOAM530d1f2KxbBjAYNN32GWIjNKQyRXSlt5jtX9ab9NDLygziLr9uxX
        IWiHkZQ+uXJGVWjZR1jNjJODi5FXaog=
X-Google-Smtp-Source: ABdhPJzJ/kU+t8TuHLxHBxAS8QgTIZiZAMTwwPlC3HpJnE3AT0XIjpC3DS/i/MyfKWYE6KhMe/rEsA==
X-Received: by 2002:a17:906:2bd9:: with SMTP id n25mr9639540ejg.359.1644232247266;
        Mon, 07 Feb 2022 03:10:47 -0800 (PST)
Received: from debian64.daheim (pd9e292b6.dip0.t-ipconnect.de. [217.226.146.182])
        by smtp.gmail.com with ESMTPSA id p23sm2861402eju.46.2022.02.07.03.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 03:10:46 -0800 (PST)
Received: from localhost.daheim ([127.0.0.1])
        by debian64.daheim with esmtp (Exim 4.95)
        (envelope-from <chunkeey@gmail.com>)
        id 1nH0yB-0007IK-EZ;
        Mon, 07 Feb 2022 12:10:46 +0100
Message-ID: <6dbef8a5-6df4-ccab-ffc0-639e16b2ebf6@gmail.com>
Date:   Mon, 7 Feb 2022 12:10:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] hwmon: (tc654) Add thermal_cooling device support
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>
References: <20220206190517.303483-1-chunkeey@gmail.com>
 <eac99325-ad4a-a636-9d96-0fa56cda35d3@roeck-us.net>
From:   Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <eac99325-ad4a-a636-9d96-0fa56cda35d3@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 07/02/2022 09:47, Guenter Roeck wrote:
> On 2/6/22 11:05, Christian Lamparter wrote:
>> Adds thermal_cooling device support to the tc654/tc655
>> driver. This make it possible to integrate it into a
>> device-tree supported thermal-zone node as a
>> cooling device.
>>
>> I have been using this patch as part of the Netgear WNDR4700
>> Centria NAS Router support within OpenWrt since 2016.
>>
>> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>
>> ---
>> v1 -> v2: - Drop imply THERMAL
>>       - aligned ( so . everything is lining up
>> ---
>>   drivers/hwmon/tc654.c | 94 +++++++++++++++++++++++++++++++++++--------
>>   1 file changed, 77 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
>> --- a/drivers/hwmon/tc654.c
>> +++ b/drivers/hwmon/tc654.c
>> @@ -367,36 +368,30 @@ static ssize_t pwm_mode_store(struct device *dev, struct device_attribute *da,
>>   static const int tc654_pwm_map[16] = { 77,  88, 102, 112, 124, 136, 148, 160,
>>                         172, 184, 196, 207, 219, 231, 243, 255};
>> +static int get_pwm(struct tc654_data *data)
>> +{
>> +    if (data->config & TC654_REG_CONFIG_SDM)
>> +        return 0;
>> +    else
> 
> Nit: else after return is unnecessary. Sorry for not noticing before.
> 
Noted.

>> @@ -447,6 +458,44 @@ static struct attribute *tc654_attrs[] = {
>>   ATTRIBUTE_GROUPS(tc654);
>> +/* cooling device */
>> +
>> +static int tc654_get_max_state(struct thermal_cooling_device *cdev,
>> +                   unsigned long *state)
>> +{
>> +    *state = 255;
>> +    return 0;
>> +}
>> +
>> +static int tc654_get_cur_state(struct thermal_cooling_device *cdev,
>> +                   unsigned long *state)
>> +{
>> +    struct tc654_data *data = tc654_update_client(cdev->devdata);
>> +
>> +    if (IS_ERR(data))
>> +        return PTR_ERR(data);
>> +
>> +    *state = get_pwm(data);
>> +    return 0;
>> +}
>> +
>> +static int tc654_set_cur_state(struct thermal_cooling_device *cdev,
>> +                   unsigned long state)
>> +{
>> +    struct tc654_data *data = tc654_update_client(cdev->devdata);
>> +
>> +    if (IS_ERR(data))
>> +        return PTR_ERR(data);
>> +
>> +    return _set_pwm(data, clamp_val(state, 0, 255));
>> +}
> 
> Looking into this further, wouldn't it be more appropriate to limit the
> cooling states to [0 .. 15], or in other words use data->duty_cycle
> directly ? I don't know how the thermal subsystem reacts if it requests
> to set the state to a certain value and the actual state is set to
> something completely different. Also, it doesn't seem to make much sense
> to bother the thermal subsystem with 256 states if the chip really only
> supports 16 states.

So there's more: Yes, the chip has 16 PWM states (from Duty Cycle 0=30%
to Duty Cycle 15=100% - each step has a linear 4,66...% increment).
The chip also has a "shutdown state/mode". where the FAN(s) are all turned
off (only the chip's I2C interface remains active for the wake-up signal).

This is why even the current pwm_show() looks so funny.
<https://github.com/torvalds/linux/blob/master/drivers/hwmon/tc654.c#L365-L380>

|static ssize_t pwm_show(struct device *dev, struct device_attribute *da,
|			char *buf)
|{
|	struct tc654_data *data = tc654_update_client(dev);
|	int pwm;
|
|	if (IS_ERR(data))
|		return PTR_ERR(data);
|---- from here ----
|	if (data->config & TC654_REG_CONFIG_SDM)
|		pwm = 0;
|	else
|		pwm = tc654_pwm_map[data->duty_cycle];
|---- to here ----
|	return sprintf(buf, "%d\n", pwm);
|}

If the chip is in that TC654_REG_CONFIG_SDM (SDM=Shutdown Mode), the PWM is 0%
and the fan is off. If it's not in TC654_REG_CONFIG_SDM, then that duty_cycle=0
gives you a PWM with 30%.

The same goes for the pwm_store. And yes, the current behavior through the
hwmon sysfs interface is a bit extreme:

pwm_store with val=0 => SDM engaged - Fans turn off.
pwm_store with val=1 => Fans are on 30%. (There's a steep cliff / steep climb)
...
pwm_store with val=~78 > Fans are on 34%
...
pwm_store with val=255 = Fans are on 100%


So, I would like to keep that shutdown state in there. The Fan on the
WNDR4700 is annoying and only needs to run from time to time.

For now, I fiddled around by adding +1 and -1 here and there. Another
option would be to extend the tc654_pwm_map. But this has the
consequence that it changes the existing behavior on the hwmon interface
as well.

I've inlined a preliminary git diff patch, if you want to take a peek
and maybe already have comments.

I want to test this on the hardware, before sending out a version...
Which I only can do on weekends (so it will be a week, hope that's ok).

Thanks,
Christian
---
diff --git a/drivers/hwmon/tc654.c b/drivers/hwmon/tc654.c
index cf2a3acd5c91..f6b6375ffeaf 100644
--- a/drivers/hwmon/tc654.c
+++ b/drivers/hwmon/tc654.c
@@ -15,6 +15,7 @@
  #include <linux/module.h>
  #include <linux/mutex.h>
  #include <linux/slab.h>
+#include <linux/thermal.h>
  #include <linux/util_macros.h>

  enum tc654_regs {
@@ -384,28 +385,19 @@ static ssize_t pwm_show(struct device *dev, struct device_attribute *da,
  	return sprintf(buf, "%d\n", pwm);
  }

-static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
-			 const char *buf, size_t count)
+static int _set_pwm(struct tc654_data *data, unsigned long val)
  {
-	struct tc654_data *data = dev_get_drvdata(dev);
  	struct i2c_client *client = data->client;
-	unsigned long val;
  	int ret;

-	if (kstrtoul(buf, 10, &val))
-		return -EINVAL;
-	if (val > 255)
-		return -EINVAL;
-
  	mutex_lock(&data->update_lock);

-	if (val == 0)
+	if (val == 0) {
  		data->config |= TC654_REG_CONFIG_SDM;
-	else
+	} else {
  		data->config &= ~TC654_REG_CONFIG_SDM;
-
-	data->duty_cycle = find_closest(val, tc654_pwm_map,
-					ARRAY_SIZE(tc654_pwm_map));
+		data->duty_cycle = val - 1;
+	}

  	ret = i2c_smbus_write_byte_data(client, TC654_REG_CONFIG, data->config);
  	if (ret < 0)
@@ -416,6 +408,24 @@ static ssize_t pwm_store(struct device *dev, struct device_attribute *da,

  out:
  	mutex_unlock(&data->update_lock);
+	return ret;
+}
+
+static ssize_t pwm_store(struct device *dev, struct device_attribute *da,
+			 const char *buf, size_t count)
+{
+	struct tc654_data *data = dev_get_drvdata(dev);
+	unsigned long val;
+	int ret;
+
+	if (kstrtoul(buf, 10, &val))
+		return -EINVAL;
+	if (val > 255)
+		return -EINVAL;
+	if (val > 0)
+		val = find_closest(val, tc654_pwm_map, ARRAY_SIZE(tc654_pwm_map)) + 1;
+
+	ret = _set_pwm(data, val);
  	return ret < 0 ? ret : count;
  }

@@ -447,6 +457,56 @@ static struct attribute *tc654_attrs[] = {

  ATTRIBUTE_GROUPS(tc654);

+/* thermal cooling device functions
+ *
+ * Account for the "ShutDown Mode (SDM)" state by offseting
+ * the 16 PWM duty cycle states by 1.
+ *
+ * State  0 =   0% PWM | Shutdown - Fan(s) are off
+ * State  1 =  30% PWM | duty_cycle =  0
+ * State  2 = ~35% PWM | duty_cycle =  1
+ * [...]
+ * State 15 = ~95% PWM | duty_cycle = 14
+ * State 16 = 100% PWM | duty_cycle = 15
+ */
+#define TC654_MAX_COOLING_STATES	16
+
+static int tc654_get_max_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	return TC654_MAX_COOLING_STATES;
+}
+
+static int tc654_get_cur_state(struct thermal_cooling_device *cdev, unsigned long *state)
+{
+	struct tc654_data *data = tc654_update_client(cdev->devdata);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	if (data->config & TC654_REG_CONFIG_SDM)
+		*state = 0;	/* FAN is off */
+	else
+		*state = data->duty_cycle + 1;	/* offset PWM States by 1 */
+
+	return 0;
+}
+
+static int tc654_set_cur_state(struct thermal_cooling_device *cdev, unsigned long state)
+{
+	struct tc654_data *data = tc654_update_client(cdev->devdata);
+
+	if (IS_ERR(data))
+		return PTR_ERR(data);
+
+	return _set_pwm(data, clamp_val(state, 0, TC654_MAX_COOLING_STATES));
+}
+
+static const struct thermal_cooling_device_ops tc654_fan_cool_ops = {
+	.get_max_state = tc654_get_max_state,
+	.get_cur_state = tc654_get_cur_state,
+	.set_cur_state = tc654_set_cur_state,
+};
+
  /*
   * device probe and removal
   */
@@ -477,7 +537,18 @@ static int tc654_probe(struct i2c_client *client)
  	hwmon_dev =
  	    devm_hwmon_device_register_with_groups(dev, client->name, data,
  						   tc654_groups);
-	return PTR_ERR_OR_ZERO(hwmon_dev);
+	if (IS_ERR(hwmon_dev))
+		return PTR_ERR(hwmon_dev);
+
+	if (IS_ENABLED(CONFIG_THERMAL)) {
+		struct thermal_cooling_device *cdev;
+
+		cdev = devm_thermal_of_cooling_device_register(dev, dev->of_node, client->name,
+							       hwmon_dev, &tc654_fan_cool_ops);
+		return PTR_ERR_OR_ZERO(cdev);
+	}
+
+	return 0;
  }

  static const struct i2c_device_id tc654_id[] = {
---
