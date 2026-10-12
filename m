Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47F3648F84D
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 15:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818671; cv=none; b=knEzSCtVL0wwI5ayhsdukAHSSbYF5YLhpJWqMKCRFstHmb6JxBJz1Qcp+xassQsC1l9P0MTaO78DrOSpulVBgKwU1zfsl5rclYhpUne362hk1V4EnH9jQ5ZCdFGZIylFYgfH4BP7ynf5oQJQrgGolxLJP9JkzGqeLVt7AVY/WxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818671; c=relaxed/simple;
	bh=QsamYftQWRPWK+13Bylgz2KT2YqLksf5IEryvwzNtDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=osqnBbw9x3biVprd1ETnZkf2KcZtQvvXx21nUhJVtmDXtPcrUmFCyCO/9mL7GbfaGClczJgStDaU86EPJRIxaSGDs1SOTIGEjY5PiPKqMsfBw6YH11ESFpFYLj/0QvZiZZqVfEfAjvZHTUAjbzHWnUiOmzvu3EfH6LWglvzKmns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TlJBnQC2; arc=none smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TlJBnQC2"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-14394530ec6so1012852c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Oct 2026 08:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818669; x=1792423469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8FckY+q/QQZWvcR4fb10gzJCCBDSweLy28ZjAA/5jao=;
        b=TlJBnQC2MM/VIyowscjTtVPQYS+8IHrBtlvRLHsv3TUp7KRJAFiKF2sorlg8RD3L+b
         n7aILFra8az7GxS5b82Mc9sgyLnITgwBqBSrh242k87yCVPiQY/tek0xFHa2Ig2Q8Ci6
         Twlo1fpIaxxHSwCWO9nORewx7+snGHm04OAcVMYs3ZsynfLShVCR/3WoUtTdl7WcIXrw
         dAhYWZpifyDjg8xqeIvV2J95jlwL/7eUNK3yMLXnryAmF3n4fSUyuSgvqg+3qHRv6C8g
         24ajYMgyZEjzA7SWGEbHAJuw6Zn2/5IuqI1QYw/ecddUo3rrOJJzxTlFK41bj65vO3P5
         cGWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818669; x=1792423469;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8FckY+q/QQZWvcR4fb10gzJCCBDSweLy28ZjAA/5jao=;
        b=EXvbaToZLVWhopjqla9+zPGQ8Lj2bfnYe4V3gqdFIjmQL5pEaQ/gVGncaJhTUH5Rg/
         X0TJb+Mdau0Z1tKTh4fjQgh6JuQCbJir5MhO88Wd9HZDWU6jDBZ9ChuBttXQMfM1CN1h
         IpZ+wEvs4BCnr2sKdfNJyA1V7b6hr3t0vqE5MqylwKt8EExDj4moDDLcUoCKYdK0XBqm
         ROYawOMaIJm2zfMjorhCGKKzj8P/JbgklMuQKhbWky8BExHDGNULPy37E1Hx6EYSgEGp
         vi0ymFfEuGTXqyDEMXbz+PewSHPTgHjrwyhqJr7GczM9tw7WfsMBcrwlzbpbGtwHPOm0
         4XXw==
X-Forwarded-Encrypted: i=1; AKwUvBxquf/O/gBTtjEna3B05tuNFYdDyBsKnlYGssw9zjnJ0Mx/LPvSa2aaVfCEDFIHGSaM0GjDO92MuSfTpg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLyKC9pGVn5Crztqt8n/bbpblOGm3Sf2PjSvX6GmVprSB1Aj29c
	Nm/5hkJX9JZgjXmEayFBAo4WmSxIqI6Vcu9D2Cij+LQNsw3OmP1T94Zj
X-Gm-Gg: AYBFou07q3xWnpBWxXpZNsXEDibONaQOSRLPxYkXqakE66llqOqOUrdyshgkR9mdKFv
	fBgz96U2DGkIeZbDNCXdtGDA9RzIdRvGeWibtw3tuQvFKNwOOnwLMuKZKONVEDioYsqZfDLbni9
	VddqLM2YPvGdnO3F32tUy8zG+1xhqJosoWQSjott2IZrcRYh+D28kmtlEk2sJ7AzIqpkzumwHQY
	SLgQEGT/bBYiqjS9ZLqG5t5sHgmqjxK0XwwzHh20UeSwPfoOoibjHzBVfdXb4Xx/TM0PtPYo1uH
	2O/ZYxMpXVbRzapVA8O1+S1AYjD8vDDZKsplLhAtMJ/ck5ZtQ4FNWAylqp40lc+Lf9D+QuFRdnz
	ggxy5qBuTFYyhisNMyrfezrdKR7BExB4YXMTaH5KBD0fLy3t0EV0MT8xdKNufk4gXxxKA4qqu8D
	YTVmWyfbaubfZD8KOGHFWN85WSFJ/lfjvQfgTjIVZKOCXKxlZ/TCOD91nzkWT3Jc7r6NzyEnlPa
	FpUs+NBXYstKJe4aDT/hyydAvwl2KvYtdCSmKL7rDc1EJ0Zzc79QJyaY4UdGSRi8DbZ
X-Received: by 2002:a05:701b:42c2:10b0:168:6ad8:e88c with SMTP id a92af1059eb24-16a63757d80mr16064629c88.39.1791818668974;
        Mon, 12 Oct 2026 08:24:28 -0700 (PDT)
Received: from archlinux ([2405:201:1b:20ef:8b08:15c4:66f2:a984])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a620bdafsm40472567c88.23.2026.10.12.08.24.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:24:28 -0700 (PDT)
Date: Mon, 12 Oct 2026 20:54:24 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Lorenzo Collevecchio <lorenzocollevecchio17@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, W_Armin@gmx.de
Subject: Re: hp-wmi: WHCM AE_AML_OPERAND_TYPE and fan init -22 on HP OmniBook
 5 16-ag1xxx (board 8DF4)
Message-ID: <asz7WqGzukhkYHGD@archlinux>
References: <CAPvUaSo1D+1Tvk3-4TMiXw-ScBtY8Mu0FzO7R_EG6zrjYfjYqg@mail.gmail.com>
 <asxTYBiGy6lf6-Ki@archlinux>
 <CAPvUaSo-ubCOCYYPadY1C23y1Fd_AAhQLuVKWRa6F1XVh6mk_Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <CAPvUaSo-ubCOCYYPadY1C23y1Fd_AAhQLuVKWRa6F1XVh6mk_Q@mail.gmail.com>

On Mon, Oct 12, 2026 at 10:08:43AM +0200, Lorenzo Collevecchio wrote:
>Hi Armin, Krishna,
>
>Thanks for the quick replies.
>
>acpidump:
>https://gist.github.com/CollevecchioLorenzo/aef5917d9775629d48618bd42cb5f5e2
>
>I booted 7.2.9-2-cachyos with modprobe.blacklist=hp_bioscfg
>(confirmed in /proc/cmdline; hp_bioscfg is not loaded). Counts of
>each message in dmesg, before and after:
>
>  WHCM AE_AML_OPERAND_TYPE:                 3 before, 3 after
>  "Failed to apply initial fan settings: -22": 1 before, 1 after
>  WQBC / WQBE AE_AML_OPERAND_VALUE:         1/1 before, 0/0 after
>
>So the WQBC/WQBE errors come from hp_bioscfg, as you suspected. The
>WHCM errors and the -22 are not caused by it: they still occur with
>hp_bioscfg blacklisted, right before "hp_wmi: Registered as platform
>profile handler".
>
>Windows, as you asked (Krishna):
>- The Windows power mode setting exists, but that is standard
>  Windows, i didn't check for HP specific.
>- Omen Gaming Hub offers a performance mode
>  option on this laptop.

Interesting, what choices does it offer you? Eco/Balanced/Performance?
Or something else?

>- The BIOS has a "Fan Always On" setting. I had it turned off
>
>Happy to test any patch or run further commands.

Can you apply the following diff and share the output of:
# dmesg | grep "hp_wmi"

Expected results:
- No "failed to apply initial fan settings: -22" in dmesg
- pwm1_enable should be hidden

Note:
- I have also added a debug print to get fan speed query result. From your
   acpidump, it looks like a stub implementation returning all zeros buffer
   (0 RPM) which should have made fan{1,2}_input visible but it's interesting
   that it isn't visible; the dmesg log should help us gain more insight.
- All other errors in dmesg may (will) be same, as this patch isn't
   intended to solve them.

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-wmi.c
index 3ec6047c0f89..ee51790549ed 100644
--- a/drivers/platform/x86/hp/hp-wmi.c
+++ b/drivers/platform/x86/hp/hp-wmi.c
@@ -2705,8 +2705,14 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
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
@@ -2715,7 +2721,9 @@ static umode_t hp_wmi_hwmon_is_visible(const void *data,
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
@@ -2931,8 +2939,13 @@ static int hp_wmi_hwmon_init(void)
  	struct device *dev = &hp_wmi_platform_dev->dev;
  	struct hp_wmi_hwmon_priv *priv;
  	struct device *hwmon;
+	int fan_count;
  	int ret;
  
+	fan_count = hp_wmi_get_fan_count_userdefine_trigger();
+	if (fan_count <= 0)
+		return 0;
+
  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
  	if (!priv)
  		return -ENOMEM;


>Thanks,
>Lorenzo
>
>
>
>
>Il giorno lun 12 ott 2026 alle ore 06:03 Krishna Chomal
><krishna.chomal108@gmail.com> ha scritto:
>>
>> +Armin Wolf
>>
>> On Sun, Oct 11, 2026 at 06:03:25PM +0200, Lorenzo Collevecchio wrote:
>> >Hello,
>> >
>> >I am seeing hp-wmi fan interface failures on an HP OmniBook 5
>> >16-ag1xxx. This is not a gaming model.
>>
>> Hi Lorenzo,
>>
>> Thanks for reporting.
>>
>> >Hardware:
>> >  product_name: HP OmniBook 5 Laptop 16-ag1xxx (16-AG1002SL)
>> >  board_name:   8DF4
>> >  BIOS:         F.12, 04/10/2026 (no newer firmware listed on LVFS for
>> >this machine)
>> >  Kernel:       7.2.9-2-cachyos (also tested 6.18.55-2-cachyos-lts;
>> >ACPICA 20250807 vs 20260408)
>> >
>> >Symptoms:
>> >1. At boot, \_SB.WMID.WHCM (called via WMAA) fails three times with
>> >   "AE_AML_OPERAND_TYPE: Needed [Buffer/String/Package], found
>> >[Integer]" while resolving operands for [Index].
>>
>> This is likely due to hp-bioscfg instead of hp-wmi.
>>
>> >2. Immediately afterwards: "hp-wmi hp-wmi: Failed to apply initial fan
>> >settings: -22".
>>
>> Ah yes! This is because we are currently enabling fan control for ALL
>> devices. If you share your acpidump, I can check if we should use the
>> HPWMI_FAN_COUNT_GET_QUERY to decide whether to allow pwm1_enable or not.
>>
>> >3. Later: "Attempt to CreateField of length zero" in \_SB.WMID.WQBC
>> >and WQBE (AE_AML_OPERAND_VALUE).
>>
>> This is also likely due to hp-bioscfg. Try booting with kernel cmdline
>> parameter "modprobe.blacklist=hp_bioscfg" and see if these disappear.
>> That will help us narrow down the scope. But in any case, I think Armin
>> Wolf will have to help here since I am not familiar with bioscfg anyway.
>>
>> >4. hp_wmi still registers as a platform profile handler (quiet
>> >balanced performance).
>>
>> This is because 8DF4 is not present in any whitelists, so it takes a
>> fallback path and uses legacy WMI queries. Honestly, I am not sure if
>> platform profile should be registered for OmniBook devices. Could you
>> let me know if Omen Gaming Hub on Windows allows you to switch
>> performance modes or there is no option for this?
>>
>> >5. /sys/devices/platform/hp-wmi/hwmon/*/ contains only pwm1_enable
>> >(rw); there is no pwm1 and no fan1_input.
>>
>> Intended.
>>
>> * pwm1_enable - As said, this is because we are currently (incorrectly)
>>                  enabling fan control for all devices.
>> * pwm1 - Absent because manual fan control must be unavailable on this
>>           board.
>> * fan1_input - Absent because get fan speed query must be failing.
>>
>> >6. On the LTS kernel the same WHCM error repeats about every 2.2 s
>> >while something polls the hp hwmon device (277 times between 551 s and
>> >1165 s uptime).
>> >7. ACPI thermal: "Invalid critical threshold (-274000)" and "No valid
>> >trip points!" for thermal zone TSZ0.
>> >
>> >Fan behaviour:
>> >- acpi_fan (acpi-fan PNP0C0B, "Using Microsoft fan extensions")
>> >exposes fan1_input. It sometimes shows about 2400 RPM and sometimes 0
>> >RPM.
>> >- The fan works normally under Windows on the same machine.
>> >- I once saw the CPU around 95 C with the fan apparently stopped on
>> >Linux; I have not been able to reproduce it yet and am collecting a
>> >temperature/RPM log.
>> >
>> >I suspect the WMI query path the driver uses for fan settings is not
>> >implemented by this firmware, so hp-wmi should probably not attempt it
>> >on board 8DF4. I would be glad to test patches or provide acpidump
>> >output, WMI GUID listings or any other data.
>>
>> acpidump would be helpful.
>>
>> Thanks,
>> Krishna
>>
>> >Thanks,
>> >Lorenzo
