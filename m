Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9652B4BF948
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 17:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827358; cv=none; b=aWUzc6wa2nAq7uH9xChS1SpwVLqgqO6fl+WRRbzLmFAin//wEw0CNKI754CkdoLCU3HxYDCE64aAafZjtgFObbpg2lKO4ik2dMWrZvFc7UJ20dhAA4kyd+fuNiU6qFsTROj7xgJbihYDR0aMRBx9o464XTNDotaab39d/W8ru4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827358; c=relaxed/simple;
	bh=+p6mIZJLsnJJpJhjGph5KNIN4Zqhw2PM9via/Xo5SMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ho6QYXDQ62NgZ1fWUjirZjS0spR0QfI/8VO7t/G5hc1B7l1Z7JmEXO1iITO6z0YveFZ8eqB7FXOK9NAWU+AF9Jo1mhXMiZR9kk/BT2Vz+FFs2tbo+HQEf/g/2RQ9vovEm0MCGk8IFB+v52NPahJlnw7ghVtJjXEu0RGj+y9dypA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJJZN70b; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJJZN70b"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35a31bb9fb6so170888eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 10:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791827356; x=1792432156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nkpzXz06/wF4egpTsHtzmtlxzFAdhJtNDN5qIdF/hQQ=;
        b=jJJZN70b4IgweDf8jguirCTUHubmqZ0KfKL2fbrBJ00nr9gHDvUAFVZRIfcIuRuVm7
         ENbAo6h/1n8XnZ7Kpho1T6JyxOU71+KEoX/gawQFGaEd/VpJR+XgUm4AHyP+Bzag+dF/
         knVtsQhT/aAI8NEzNUCwXLuiGOj51hBrXaCjJIqS8naqarpI8hiOXku661mlszjuBh3o
         M9zA9RAbU32r+wEMZAH862U5tDB3jedA23+w9jb8KETv0bd+Q4we+mKj9enuNPF1lzCl
         MNTUf2himh9UcJxZimLCAtFZ7m9RjG0nSpaIezb3mFvTqc73wU/6GHW7bSycrZ/C6F9F
         kFBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827356; x=1792432156;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nkpzXz06/wF4egpTsHtzmtlxzFAdhJtNDN5qIdF/hQQ=;
        b=XDi4h//qen7AAK7v9CC7vLiyTT2oakEdSZsJsCCe5yvzkjG4T3irHGWaLNp/0HlFHZ
         uyQJNZs6hY6fYKAE05Pl8Oig93XObj8OoXBwBei2www5yRXio2l14pSYkxcpk3weGrwf
         lRM9M4GxJ4QVJV+GHOsyPXORaWHRyXoTL+5JAcH7ptY8OIJ2cpOLIR7XWcfa7d9IeaoP
         9h0c/g2ak5vTwow1NJqlODRpPWUJ3YFsf250/ooZqTrqjGEfe+F6H7lNeR6UAyJLmErO
         qSI/w/BpYL5OLgpm5BSYvXCMDNX0a0DLiMDdgXIFBqIaJ4e7P92MJPOSAx21sgJC8pg+
         Fpkw==
X-Forwarded-Encrypted: i=1; AKwUvBzwJN3P5hGiRuqlzypDG3+lig0lliUMcsE5b4vZGXxw7v0GOCngIedcTxi3ndVuwhnNvsWbH1BVVdm9eQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYLfF4gYyIBbwBBflhHb0anuDP8T5gLCHK7dG2LCKWHC0hqY9a17
	pDAvuhP0MUmtX/4B8/+rlgsefv+RwKYQU2Kt8vBKrIpMsmnKpVZzbJw80cgltA==
X-Gm-Gg: AYBFou3OHPvnLb47F4caH8ZLvhkuFxMYFqqs69Sh41MAt7/21r7+SK6g7hMFYJpwLij
	EQYKVd6p0E1hHMdJSTgaJlA1jdUPQriY1pZ7tht9S3Qj5UPdg3rS43nuursbW/IMe6wKPeoSwx7
	FdVUEaq4TDQaIgTTboHkVlfbNSwHrl7ZNbRW4+Hw3CTOzc8MmL+cMbYtUQaHwW0GKqen7CU/RLh
	xtsVqOkpjatdQJuXdYu3O/OaPhw3V+rbGKuCyEltYRNlUqbUGsv3JefvryrPrZ5BblSV3ok4LDe
	KJ/0/HAny98W9CSW/709EkbQJ5vTufx698BxoaTXKpHfYo9kxd0r/iTSTntIbcRhPXjfHq+Q4m9
	Ol3vVpHKTFEQ5906xWHtNpM1keUxWUOBMDpsDyMUppQFw8EI+QXZV6SSswQqGCbqyZaQvJbOy/G
	x8ZEfRdoGU4M++W9O77EmHBe5dGPXRP/MAvbjcfDIfh19xQC2H7rb/7pZePGdkuOyja1hiIj2YH
	LiLY+My36HiJkNKhxPfimqDWPXOnTs/q6XZZqaK6/sLHvCeRrVt4DJ+v7typBsU5v23plVUUXbT
	y3U=
X-Received: by 2002:a05:7300:ea83:b0:359:8540:19d1 with SMTP id 5a478bee46e88-35985401c49mr6418998eec.15.1791827355322;
        Mon, 12 Oct 2026 10:49:15 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:268a:fa82:9f05:61a5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm39612287eec.0.2026.10.12.10.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 10:49:14 -0700 (PDT)
Date: Mon, 12 Oct 2026 23:19:09 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
Message-ID: <as0bOFOoaaw-smyB@archlinux>
References: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
 <asxTYBiGy6lf6-Ki@archlinux>
 <CAPvUaSo-ubCOCYYPadY1C23y1Fd_AAhQLuVKWRa6F1XVh6mk_Q@mail.gmail.com>
 <asz7WqGzukhkYHGD@archlinux>
 <CAPvUaSrbWrBuvAi3R02xC8w8M5Yh97pVd3-+FBXLp3mPgG5cUQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPvUaSrbWrBuvAi3R02xC8w8M5Yh97pVd3-+FBXLp3mPgG5cUQ@mail.gmail.com>

On Mon, Oct 12, 2026 at 06:04:37PM +0200, Lorenzo Collevecchio wrote:
>Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP
>OmniBook 5 16-ag1xxx (board 8DF4)
>
>Hi Krishna,
>
>Thanks for the patch. Results below.
>
>Base and adaptation:
>I used drivers/platform/x86/hp/hp-wmi.c from stable v7.2.9, built out
>of tree against 7.2.9-2-cachyos. Your diff did not apply cleanly: hunk
>1 failed, because my hp_wmi_hwmon_is_visible() uses
>is_victus_s_thermal_profile() and hp_wmi_get_fan_speed_victus_s()
>rather than the helpers in your context lines. Hunks 2 and 3 applied
>with offsets of about -230 lines. So I made these changes by hand:
>  - declared int fan_speed in hp_wmi_hwmon_is_visible()
>  - added your pr_info() and the fan_speed variable in the non-Victus
>hwmon_fan branch
>  - added the fan_count <= 0 early return in hp_wmi_hwmon_init()
>I did NOT add the hwmon_pwm_enable check in is_visible(), since the
>early return in init already prevents hwmon registration. If you want
>me to test against a different tree, tell me which one.
>
>Test: normal boot (hp_bioscfg not blacklisted), then rmmod hp_wmi and
>insmod the patched module. Output of dmesg | grep -i -E
>"hp.wmi|WHCM|WQB|fan", showing the stock boot first and then the
>reload at about 5156 s:
>
>[    6.453093] ACPI Error: Aborting method \_SB.WMID.WHCM ...
>(AE_AML_OPERAND_TYPE)
>[    6.655089] ACPI Error: Aborting method \_SB.WMID.WHCM ...
>(AE_AML_OPERAND_TYPE)
>[    6.857553] ACPI Error: Aborting method \_SB.WMID.WHCM ...
>(AE_AML_OPERAND_TYPE)
>[    6.857581] hp-wmi hp-wmi: Failed to apply initial fan settings: -22
>[    7.262812] hp_wmi: Registered as platform profile handler
>[    7.308567] ACPI Error: Aborting method \_SB.WMID.WQBC ...
>(AE_AML_OPERAND_VALUE)
>[    7.309182] ACPI Error: Aborting method \_SB.WMID.WQBE ...
>(AE_AML_OPERAND_VALUE)
>[ 5156.582212] hp_wmi: loading out-of-tree module taints kernel.
>[ 5156.582224] hp_wmi: module verification failed: signature and/or
>required key missing - tainting kernel
>[ 5157.203181] input: HP WMI hotkeys as /devices/virtual/input/input27
>[ 5157.614765] ACPI Error: Aborting method \_SB.WMID.WHCM ...
>(AE_AML_OPERAND_TYPE)
>[ 5158.026462] hp_wmi: Registered as platform profile handler
>
>What I see with the patched module:
>  - "Failed to apply initial fan settings: -22" is gone.
>  - /sys/devices/platform/hp-wmi/hwmon/ does not exist any more, so
>pwm1_enable is hidden as you expected.
>  - Only one WHCM error is logged after the reload instead of three. I
>do not know which call produces it; I am guessing it is the fan count
>query.
>  - No "channel = ... | fan_speed = ..." lines appear, because no
>hwmon device is registered once fan_count <= 0, so is_visible() never
>runs. If you want to see the fan speed query result, the print would
>have to go somewhere that runs in this case. I can test a modified
>patch.
>  - WQBC/WQBE do not appear in the reload because only hp_wmi was
>reloaded (hp_bioscfg stayed loaded).
>  - The platform profile still registers with quiet balanced performance.
>
>Fan Always On in the BIOS was off during all my tests.
>
>Fan behaviour, in case it is useful: on a cold boot with a 2-core
>stress-ng load, the CPU went from 46 C to 80 C in about 18 seconds
>while acpi_fan fan1_input stayed at 0 RPM (Fan Always On off). I
>stopped the test at 80 C. I can send the full log, and I can retest
>with Fan Always On enabled if you want.
>
>Happy to test further patches.

My fault, sorry. I should have clarified earlier that my patch was
based off of pdx86 tree[1] (master branch). Regarding the patch yes,
by mistake I ended up disabling the whole hwmon device (not what we
want). Let's register the hwmon device first then later handle the fan
logic optionally with the count guards.

Now hwmon should be available but pwm1_enable will be hidden. Also,
fan{1,2}_input is expected to be visible, I am not sure why it isn't
showing up for your device.

(as usual, rest all errors would be same)

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index b2773fc1aca4..422d65d5c514 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2679,8 +2679,14 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
  				       enum hwmon_sensor_types type,
  				       u32 attr, int channel)
  {
+	int fan_count;
+	int fan_speed;
+
  	switch (type) {
  	case hwmon_pwm:
+		fan_count = hp_wmi_get_fan_count_userdefine_trigger();
+		if (attr == hwmon_pwm_enable && fan_count <= 0)
+			return 0;
  		if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
  			return 0;
  		return 0644;
@@ -2689,7 +2695,9 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
  			if (hp_wmi_get_active_fan_speed(channel) >= 0)
  				return 0444;
  		} else {
-			if (hp_wmi_get_fan_speed(channel) >= 0)
+			fan_speed = hp_wmi_get_fan_speed(channel);
+			pr_info("channel = %d | fan_speed = %d\n", channel, fan_speed);
+			if (fan_speed >= 0)
  				return 0444;
  		}
  		break;
@@ -2905,6 +2913,7 @@ static int hp_wmi_hwmon_init(void)
  	struct device *dev = &hp_wmi_platform_dev->dev;
  	struct hp_wmi_hwmon_priv *priv;
  	struct device *hwmon;
+	int fan_count;
  	int ret;
  
  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
@@ -2915,11 +2924,17 @@ static int hp_wmi_hwmon_init(void)
  	if (ret)
  		return ret;
  
+	hwmon = devm_hwmon_device_register_with_info(dev, "hp", priv,
+						     &chip_info, NULL);
+
+	fan_count = hp_wmi_get_fan_count_userdefine_trigger();
+	pr_info("fan_count = %d\n", fan_count);
+	if (fan_count <= 0)
+		return 0;
+
  	ret = hp_wmi_setup_fan_settings(priv);
  	if (ret)
  		return ret;
-	hwmon = devm_hwmon_device_register_with_info(dev, "hp", priv,
-						     &chip_info, NULL);
  
  	if (IS_ERR(hwmon)) {
  		dev_err(dev, "Could not register hp hwmon device\n");

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git

>Thanks,
>Lorenzo
>
>Il giorno lun 12 ott 2026 alle ore 17:24 Krishna Chomal
><krishna.chomal108@gmail.com> ha scritto:
>>
>> On Mon, Oct 12, 2026 at 10:08:43AM +0200, Lorenzo Collevecchio wrote:
>> >Hi Armin, Krishna,
>> >
>> >Thanks for the quick replies.
>> >
>> >acpidump:
>> >https://gist.github.com/CollevecchioLorenzo/aef5917d9775629d48618bd42cb5f5e2
>> >
>> >I booted 7.2.9-2-cachyos with modprobe.blacklist=hp_bioscfg
>> >(confirmed in /proc/cmdline; hp_bioscfg is not loaded). Counts of
>> >each message in dmesg, before and after:
>> >
>> >  WHCM AE_AML_OPERAND_TYPE:                 3 before, 3 after
>> >  "Failed to apply initial fan settings: -22": 1 before, 1 after
>> >  WQBC / WQBE AE_AML_OPERAND_VALUE:         1/1 before, 0/0 after
>> >
>> >So the WQBC/WQBE errors come from hp_bioscfg, as you suspected. The
>> >WHCM errors and the -22 are not caused by it: they still occur with
>> >hp_bioscfg blacklisted, right before "hp_wmi: Registered as platform
>> >profile handler".
>> >
>> >Windows, as you asked (Krishna):
>> >- The Windows power mode setting exists, but that is standard
>> >  Windows, i didn't check for HP specific.
>> >- Omen Gaming Hub offers a performance mode
>> >  option on this laptop.
>>
>> Interesting, what choices does it offer you? Eco/Balanced/Performance?
>> Or something else?
>>
>> >- The BIOS has a "Fan Always On" setting. I had it turned off
>> >
>> >Happy to test any patch or run further commands.
>>
>> Can you apply the following diff and share the output of:
>> # dmesg | grep "hp_wmi"
>>
>> Expected results:
>> - No "failed to apply initial fan settings: -22" in dmesg
>> - pwm1_enable should be hidden
>>
>> Note:
>> - I have also added a debug print to get fan speed query result. From your
>>    acpidump, it looks like a stub implementation returning all zeros buffer
>>    (0 RPM) which should have made fan{1,2}_input visible but it's interesting
>>    that it isn't visible; the dmesg log should help us gain more insight.
>> - All other errors in dmesg may (will) be same, as this patch isn't
>>    intended to solve them.
>>
>> diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
>> index 3ec6047c0f89..ee51790549ed 100644
>> --- a/drivers/platform/x86/hp/hp-wmi.c
>> +++ b/drivers/platform/x86/hp/hp-wmi.c
>> @@ -2705,8 +2705,14 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>>                                        enum hwmon_sensor_types type,
>>                                        u32 attr, int channel)
>>   {
>> +       int fan_count;
>> +       int fan_speed;
>> +
>>         switch (type) {
>>         case hwmon_pwm:
>> +               fan_count = hp_wmi_get_fan_count_userdefine_trigger();
>> +               if (attr == hwmon_pwm_enable && fan_count <= 0)
>> +                       return 0;
>>                 if (attr == hwmon_pwm_input && !hp_wmi_fan_control_supported())
>>                         return 0;
>>                 return 0644;
>> @@ -2715,7 +2721,9 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
>>                         if (hp_wmi_get_active_fan_speed(channel) >= 0)
>>                                 return 0444;
>>                 } else {
>> -                       if (hp_wmi_get_fan_speed(channel) >= 0)
>> +                       fan_speed = hp_wmi_get_fan_speed(channel);
>> +                       pr_info("channel = %d | fan_speed = %d\n", channel, fan_speed);
>> +                       if (fan_speed >= 0)
>>                                 return 0444;
>>                 }
>>                 break;
>> @@ -2931,8 +2939,13 @@ static int hp_wmi_hwmon_init(void)
>>         struct device *dev = &hp_wmi_platform_dev->dev;
>>         struct hp_wmi_hwmon_priv *priv;
>>         struct device *hwmon;
>> +       int fan_count;
>>         int ret;
>>
>> +       fan_count = hp_wmi_get_fan_count_userdefine_trigger();
>> +       if (fan_count <= 0)
>> +               return 0;
>> +
>>         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>>         if (!priv)
>>                 return -ENOMEM;
>>
>>
>> >Thanks,
>> >Lorenzo
>> >
>> >
>> >
>> >
>> >Il giorno lun 12 ott 2026 alle ore 06:03 Krishna Chomal
>> ><krishna.chomal108@gmail.com> ha scritto:
>> >>
>> >> +Armin Wolf
>> >>
>> >> On Sun, Oct 11, 2026 at 06:03:25PM +0200, Lorenzo Collevecchio wrote:
>> >> >Hello,
>> >> >
>> >> >I am seeing hp-wmi fan interface failures on an HP OmniBook 5
>> >> >16-ag1xxx. This is not a gaming model.
>> >>
>> >> Hi Lorenzo,
>> >>
>> >> Thanks for reporting.
>> >>
>> >> >Hardware:
>> >> >  product_name: HP OmniBook 5 Laptop 16-ag1xxx (16-AG1002SL)
>> >> >  board_name:   8DF4
>> >> >  BIOS:         F.12, 04/10/2026 (no newer firmware listed on LVFS for
>> >> >this machine)
>> >> >  Kernel:       7.2.9-2-cachyos (also tested 6.18.55-2-cachyos-lts;
>> >> >ACPICA 20250807 vs 20260408)
>> >> >
>> >> >Symptoms:
>> >> >1. At boot, \_SB.WMID.WHCM (called via WMAA) fails three times with
>> >> >   "AE_AML_OPERAND_TYPE: Needed [Buffer/String/Package], found
>> >> >[Integer]" while resolving operands for [Index].
>> >>
>> >> This is likely due to hp-bioscfg instead of hp-wmi.
>> >>
>> >> >2. Immediately afterwards: "hp-wmi hp-wmi: Failed to apply initial fan
>> >> >settings: -22".
>> >>
>> >> Ah yes! This is because we are currently enabling fan control for ALL
>> >> devices. If you share your acpidump, I can check if we should use the
>> >> HPWMI_FAN_COUNT_GET_QUERY to decide whether to allow pwm1_enable or not.
>> >>
>> >> >3. Later: "Attempt to CreateField of length zero" in \_SB.WMID.WQBC
>> >> >and WQBE (AE_AML_OPERAND_VALUE).
>> >>
>> >> This is also likely due to hp-bioscfg. Try booting with kernel cmdline
>> >> parameter "modprobe.blacklist=hp_bioscfg" and see if these disappear.
>> >> That will help us narrow down the scope. But in any case, I think Armin
>> >> Wolf will have to help here since I am not familiar with bioscfg anyway.
>> >>
>> >> >4. hp_wmi still registers as a platform profile handler (quiet
>> >> >balanced performance).
>> >>
>> >> This is because 8DF4 is not present in any whitelists, so it takes a
>> >> fallback path and uses legacy WMI queries. Honestly, I am not sure if
>> >> platform profile should be registered for OmniBook devices. Could you
>> >> let me know if Omen Gaming Hub on Windows allows you to switch
>> >> performance modes or there is no option for this?
>> >>
>> >> >5. /sys/devices/platform/hp-wmi/hwmon/*/ contains only pwm1_enable
>> >> >(rw); there is no pwm1 and no fan1_input.
>> >>
>> >> Intended.
>> >>
>> >> * pwm1_enable - As said, this is because we are currently (incorrectly)
>> >>                  enabling fan control for all devices.
>> >> * pwm1 - Absent because manual fan control must be unavailable on this
>> >>           board.
>> >> * fan1_input - Absent because get fan speed query must be failing.
>> >>
>> >> >6. On the LTS kernel the same WHCM error repeats about every 2.2 s
>> >> >while something polls the hp hwmon device (277 times between 551 s and
>> >> >1165 s uptime).
>> >> >7. ACPI thermal: "Invalid critical threshold (-274000)" and "No valid
>> >> >trip points!" for thermal zone TSZ0.
>> >> >
>> >> >Fan behaviour:
>> >> >- acpi_fan (acpi-fan PNP0C0B, "Using Microsoft fan extensions")
>> >> >exposes fan1_input. It sometimes shows about 2400 RPM and sometimes 0
>> >> >RPM.
>> >> >- The fan works normally under Windows on the same machine.
>> >> >- I once saw the CPU around 95 C with the fan apparently stopped on
>> >> >Linux; I have not been able to reproduce it yet and am collecting a
>> >> >temperature/RPM log.
>> >> >
>> >> >I suspect the WMI query path the driver uses for fan settings is not
>> >> >implemented by this firmware, so hp-wmi should probably not attempt it
>> >> >on board 8DF4. I would be glad to test patches or provide acpidump
>> >> >output, WMI GUID listings or any other data.
>> >>
>> >> acpidump would be helpful.
>> >>
>> >> Thanks,
>> >> Krishna
>> >>
>> >> >Thanks,
>> >> >Lorenzo
