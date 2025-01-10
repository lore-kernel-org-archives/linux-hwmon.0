Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C18BA50;
	Fri, 10 Jan 2025 20:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736539627; cv=none; b=U77gjd5zaCeTBsMSQeQgfQkiQL2ZqVCA3o8lZYCBe9/NrxYQzuwDCnbWG0rD+IkPgc2tX5e4N5Fnr4O0qMZyyAgAHvPbR4xtvjzLdxLvnDXNIvCB6FpVbGKncl4Bapqa0Ptds1pzfC3glQcv1ultzIgWgqIaorfmJL2q88lKXdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736539627; c=relaxed/simple;
	bh=LF9XYXci0MeCLYuEFF59z8ZcKzUi287BWnweDLP6qrU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	 MIME-Version:Content-Type; b=CVdEamhEfzrPOFAXgDu2pDpV9aMtEweVW8HM7kWjfETmvW+BhzExj5Hz1KJ08e44xHC+eSPYbiULsOEym3tewc1BWmjbdauSzqs59a/whmGa5fz6IPkCjUqQJJIBdsp5nQu9HNWqNcGW/4ULC3UGbAus2IK7KpfTq1qm2X2FwmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8CDA9C0003;
	Fri, 10 Jan 2025 20:07:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
	(envelope-from <peter@korsgaard.com>)
	id 1tWLHX-009inj-1p;
	Fri, 10 Jan 2025 21:06:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Guenter Roeck <linux@roeck-us.net>,  Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,  linux-hwmon@vger.kernel.org,  Jean Delvare
 <jdelvare@suse.com>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pwm-fan: Document
 default-pwm property
References: <20250103101448.890946-1-peter@korsgaard.com>
	<20250103195810.GA2624225-robh@kernel.org>
	<dbf7cdd3-c5ab-4801-be85-163124b8a898@korsgaard.com>
	<20250106173805.GA501301-robh@kernel.org>
Date: Fri, 10 Jan 2025 21:06:59 +0100
In-Reply-To: <20250106173805.GA501301-robh@kernel.org> (Rob Herring's message
	of "Mon, 6 Jan 2025 11:38:05 -0600")
Message-ID: <87sepq8mcc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-GND-Sasl: peter@korsgaard.com

>>>>> "Rob" == Rob Herring <robh@kernel.org> writes:
On 1/6/25 18:38, Rob Herring wrote:

>> I am not sure I what you mean with the RPM reference here? The
>> cooling-levels support in the fan-pwm.c driver is a mapping between cooling
>> levels and PWM values, NOT RPM value.
> 
> Did I say RPM anywhere for this option?
> 
> It is the index of the array that is meaningful to anything outside of
> the driver. The values are opaque. They are duty cycle in some cases
> and RPMs in other cases. The thermal subsystem knows nothing about PWM
> duty cycle nor RPMs.
> 
> Defining a default-cooling-level would be useful to anyone, not just
> your usecase.
> 
> IOW, you are proposing:
> 
> default-pwm = <123>;
> 
> I'm proposing doing this instead:
> 
> cooling-levels = <0 123 255>;
> default-cooling-level = <1>;

I don't have CONFIG_THERMAL enabled in my builds (and don't know the
subsystem), but I see the pwm-fan driver has some logic to default to
the highest cooling level, it just forgets to actually set the PWM to
match it, so perhaps we can just fix that?

E.G. something like:

commit 02c8ba74eb7dddf210ceefa253385bc8e40f49ae
Author: Peter Korsgaard <peter@korsgaard.com>
Date:   Thu Jan 2 18:26:45 2025 +0100

    hwmon: (pwm-fan): Default to the Maximum cooling level if provided
    
    The pwm-fan driver uses full PWM (255) duty cycle at startup, which may not
    always be desirable because of noise or power consumption peaks.
    
    The driver optionally accept a list of "cooling-levels" for the thermal
    subsystem.  If provided, use the PWM value corresponding to the maximum
    cooling level rather than the full level.
    
    Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

diff --git a/drivers/hwmon/pwm-fan.c b/drivers/hwmon/pwm-fan.c
index 53a1a968d00d..33525096f1e7 100644
--- a/drivers/hwmon/pwm-fan.c
+++ b/drivers/hwmon/pwm-fan.c
@@ -499,6 +499,7 @@ static int pwm_fan_probe(struct platform_device *pdev)
 	const struct hwmon_channel_info **channels;
 	u32 pwm_min_from_stopped = 0;
 	u32 *fan_channel_config;
+	u32 default_pwm = MAX_PWM;
 	int channel_count = 1;	/* We always have a PWM channel. */
 	int i;
 
@@ -545,11 +546,18 @@ static int pwm_fan_probe(struct platform_device *pdev)
 
 	ctx->enable_mode = pwm_disable_reg_enable;
 
+	ret = pwm_fan_get_cooling_data(dev, ctx);
+	if (ret)
+		return ret;
+
+	if (ctx->pwm_fan_cooling_levels)
+		default_pwm = ctx->pwm_fan_cooling_levels[ctx->pwm_fan_max_state];
+
 	/*
-	 * Set duty cycle to maximum allowed and enable PWM output as well as
+	 * Set duty cycle to default and enable PWM output as well as
 	 * the regulator. In case of error nothing is changed
 	 */
-	ret = set_pwm(ctx, MAX_PWM);
+	ret = set_pwm(ctx, default_pwm);
 	if (ret) {
 		dev_err(dev, "Failed to configure PWM: %d\n", ret);
 		return ret;
@@ -661,10 +669,6 @@ static int pwm_fan_probe(struct platform_device *pdev)
 		return PTR_ERR(hwmon);
 	}
 
-	ret = pwm_fan_get_cooling_data(dev, ctx);
-	if (ret)
-		return ret;
-
 	ctx->pwm_fan_state = ctx->pwm_fan_max_state;
 	if (IS_ENABLED(CONFIG_THERMAL)) {
 		cdev = devm_thermal_of_cooling_device_register(dev,


Guenter, what do you say? This way we don't need any new device tree
properties. I personally find it less clear than a default-pwm property,
but oh well.

-- 
Bye, Peter Korsgaard
