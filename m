Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5D30E821
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 18:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787424668; cv=pass; b=FcQ0fk3Y3lSodoGnaNk0bjkUT1ldZRzGVI/zLcHAn2d/PeC5Q5v01C510XhJJ+1bRB/pfia9G9D/LdBZEoLj7+tydpMtuiXayp5rw+CD3mzSoXhjACZIr+QzFnB2WQBguCnqnIxsnfsk6PjHL7iM7W8leWtO0alsskirD4rb3pY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787424668; c=relaxed/simple;
	bh=E/lkGrE8eFxhCKksz8IOVxr+kG9Nmr7WqYo4ZLAYDU4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lTBfxm1EyRtH18ipfGy4TCUiJlckEgizUkcninQfQSvAdWBMiLRIkSn4E4x8usescNkZeY7ECDdHwHgnwhZLBPLVuvtGZ6IBp0+zp+g5MzWdczeMb1lk25YuI1LF7wil29uHEmahJV4m6UYC63570w2r2bnNYfk7c516GF4p1w8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJQNjDuZ; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJQNjDuZ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-39266382df6so1677328a91.3
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 11:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787424666; cv=none;
        d=google.com; s=arc-20260327;
        b=fl41DncDp1YgtRaUXDSKHvoTOeHry9rtlXR7MxTXTtdKevmrY2b2LJmzTrhD85yWew
         gG12KUohUDlCG2sTCoBDR3pglOrP4X+XVlSYvJVGuCkfqeAkcRbAquENkoSM1ud/Aqg0
         VCIkWJLjV5BkeTAueHBhvgoZ4iAzVtDyjQT+byv9QTavrMBQtTSifvLgTBctfXKd+9kn
         uDBd7EgCR9slrBaedkHy1Kc7KXIHz0bGW3inYTTjbHnd4cmNs2yiwhoINtG+2XaTUNg0
         Gs8vxgBOzaml43IMyu1WfLK03dWTWtB1Q2dzlMypbj+75QsSItmpSC1niHHiOhmc3UuT
         jNhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PM4LvgfnDHomfkNR74SqlliaUgcMVm2TRU5JeRJ88y0=;
        fh=RkJF0PcjdWpcLbbJGpxMC5jmah3/JgqtOIpsP/onURg=;
        b=d4JnHhUjslNC5CXCieXW2jpOX0LTGz3l0irtcglLZR9HdwAwdMDiWHXBCrIE0p+iCI
         0u1qDZ8d547wfbqMATOsZRpjW/EYlBQy06RwP3R1tMGFfeQKAIw+ZTYF0dnbIBcrbHPV
         WvuJZQlFYMtbYOAYILoetgYqbH7nIc5/yY3Pfwf9A/EFe/JtbIkA0srKAwHnCphW40Nt
         ndVv6F9gtwSYuPtdRpZM1IxuauwJ4c6Qgem+tYrgxTxR21ZDTxwMobxdqMcQGnWpdeQI
         QXj3ioeumGWqluNWYxlP3UBu8glk4jVM5YdzRHfuFUVav5FjLkyGzLJuQ4VcFpMJwB0t
         ofHQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787424666; x=1788029466; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PM4LvgfnDHomfkNR74SqlliaUgcMVm2TRU5JeRJ88y0=;
        b=TJQNjDuZF6SjP6/hYQk4g2M34v5uD48ggHjGsJfGg10AZxkMtbo1LZwo/hgPo5Wxf6
         8392av4akhX1mKOvZ++XwRc+jZcOOJ9tDalETOhKj1xjttsLHgVn1Kq4NnOBoaTxYpnH
         b3U2iTj9J79w1E2Jk6w96K5THWbS51r5Qn3PH9ScwdjPhSyTYSJK9sL/K2ZvM2SqOJX+
         eaX4QjcUwVAWZW9svw7dlyF5NhXpaAJmDiHAtX/wnycSUxoRpakpduNDDGma6jn3C4IQ
         B3wC3t+cUYZ8M4Uz5biMXjVhTQjepptf1e/n2i/Wjuuo9TYf1Jl6hRInbucPbZ7XAYLN
         prbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787424666; x=1788029466;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PM4LvgfnDHomfkNR74SqlliaUgcMVm2TRU5JeRJ88y0=;
        b=Pq5gVnifFFydF1pgN+a224hmHvisb5Nxca4Vm4oP0Pg1Fg7rRzXNEQLzdw2sOCDRVU
         fMqF7yyJPgCzS1PXBh9Y8MhDDEWXDLAvShjmWFF2ZsVHqNGEgR3tWva30Q12VqP/MwBT
         Vcp3UfgIGekQ4HXntd4a2mxwHo2PPjf9vui4M8V3x4MHi3Zt0zK/2yzEc8JL+vIqgSDw
         QmSEcM4LLAXXeHxtNjLRm7EHFQaNBasgGnrFgk1swydZVN9EVtm+c/GrumnubR+LDnHV
         6ePaMBJcxnOtm6JO4Ov5sqsVzkpCXhKUgImzNlncr33m1d1yk7EG4Vq+Kn4AlelMe743
         Zp4w==
X-Forwarded-Encrypted: i=1; AHgh+Rq+hCjFr3wx+1HewiulukSFhTSPza4s5JX7av6GU28Vk8ots+59866h2r4iQq4UQkff7/K9eg0pHZOX1g==@vger.kernel.org
X-Gm-Message-State: AFuF++lZL2Vg+ToZDjUJ9rjJT+7Nhr92clBnu8KvlLLxN2FGqkzpTiiu
	30sWqWIXqKiFlC6vaX08+W6a0k3yEBm86QFrtUmbVAaSYloM4zNTi+KekV/+7hRarcpX5ZlMv7D
	H5AaCn6zsxiiHC1SigP2X6b+h8Ztrcm0=
X-Gm-Gg: AR+sD12K2rSFPWqEXmvxq2lyS+AvA4eWZxEoRXqxhk5gmA4n9fLGkcq15vtruifWDHa
	1GKAWQHIKHNSYzrg1p7bzF5aiOMf7pgAtNmsEd4GuE9MjmuKRzVhtJ86ynF61oT+M19awgtve7N
	wftiRVFCJLHabQCNYrpQCyzGS5MCi1cnR3Sz3WH+60hQfXQiUbpYmtE1OmL42+81hHRtCtUxQvM
	DxUBmAOlIB7Ho8lHHoW4kMc31bYGitRDCcdmUzc20RTKIYkoY+ATIGzVAsgEKrYH1A5n+5IvzEX
	9TWHV8lQman61buYpsiDKh9SU28/YPtvh5OoLrwf/r3UeWtPHFVF5KoqNgvEF0GP1MqUeO6NzmA
	tT3niUzCqiD+3i+NRdhJ5q04fmf7UAx5Huh0XL38EE471mY69rJUnsF7z0d6CT0HiXDjrqON+lf
	4YHRwEMwesw2E=
X-Received: by 2002:a17:90b:6cb:b0:366:3517:1aa2 with SMTP id
 98e67ed59e1d1-395c2f13243mr29676360a91.0.1787424665924; Sat, 22 Aug 2026
 11:51:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821214728.87773-1-mradityadash@gmail.com> <20260821214728.87773-3-mradityadash@gmail.com>
In-Reply-To: <20260821214728.87773-3-mradityadash@gmail.com>
From: Antheas Kapenekakis <kapenekakis@gmail.com>
Date: Sat, 22 Aug 2026 20:50:54 +0200
X-Gm-Features: AcwNN1XQ7EsxVcjRV_5T832h_iYQ8bKUtDKzRFxBgEr078sh1UYgIpkbXJ8sBMo
Message-ID: <CAGwozwFxcek8q1r7wXDmOOnt8HmNh3pFgY1fY169+SQi-_6MYA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] platform/x86: lenovo-wmi-other: Add Legion Go fan
 RPM fallback
To: Aditya Dash <mradityadash@gmail.com>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 23:47, Aditya Dash <mradityadash@gmail.com> wrote:
>
> Some Legion Go firmware does not mark fan 1 RPM as readable in Capability
> Data, although Other Mode feature 0x04030001 returns the current RPM. As a
> result, lenovo-wmi-other hides fan1_input.
>
> When the normal VALID and GET flags are missing on a supported product,
> try one read from the Other Mode feature. Expose fan1_input as read-only
> if the read succeeds and does not return 0xffffffff. Treat a later
> 0xffffffff reply as an unavailable reading.

What is your source for 0xffffffff doing this, assuming your device
does not report it? Do you know of a device in-field that does this?
It might be preferable to quirk here or just live without rpm for the
affected bioses and have the vendor push an update and drop this
patch. Not reporting the fan speed is not the end of the world. @Mark
might be able to help here. Legion participates in fwupd, so they
should be able to fix this, at least for the Go S and Go 2 moving
forward. For the original Go, it is not the end of the world.

Antheas

> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>
> ---
>  Documentation/wmi/devices/lenovo-wmi-other.rst |  4 ++++
>  drivers/platform/x86/lenovo/wmi-other.c        | 14 +++++++++++++-
>  2 files changed, 17 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index 75f2deaaef16..c93e9e6f3fd0 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -56,6 +56,10 @@ On supported Legion Go models, Other Mode feature ``0x04020000`` controls
>  Full Speed mode in firmware. The driver exposes it as ``pwm1_enable``. Value 0
>  enables Full Speed, and value 2 returns fan control to firmware.
>
> +Some Legion Go firmware does not advertise fan 1 RPM through Capability
> +Data. In that case, the driver reads Other Mode feature ``0x04030001`` for
> +``fan1_input``. Value ``0xffffffff`` means that RPM is unavailable.
> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
>
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index c180933e1d18..b4be7739b243 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c
> @@ -98,6 +98,7 @@ enum lwmi_feature_id_psu {
>  #define LWMI_FAN_ID(x) ((x) + LWMI_FAN_ID_BASE)
>
>  #define LWMI_FAN_DIV 100
> +#define LWMI_FAN_RPM_NORMAL_SUPPORT (LWMI_SUPP_VALID | LWMI_SUPP_GET)
>
>  #define LWMI_CHARGE_BEHAVIOR_DISCHARGE 0x00
>  #define LWMI_CHARGE_BEHAVIOR_AUTO      0x01
> @@ -195,6 +196,7 @@ struct lwmi_om_priv {
>
>         struct lwmi_fan_info fan_info[LWMI_FAN_NR];
>         bool fullspeed_supported;
> +       bool fan0_input_fallback;
>
>         struct {
>                 bool capdata00_collected : 1;
> @@ -343,6 +345,8 @@ static umode_t lwmi_om_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_t
>                 return 0644;
>
>         if (type == hwmon_fan) {
> +               if (channel == 0 && priv->fan0_input_fallback && attr == hwmon_fan_input)
> +                       return 0444;
>                 if (!(priv->fan_info[channel].supported & LWMI_SUPP_VALID))
>                         return 0;
>
> @@ -419,6 +423,8 @@ static int lwmi_om_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>                         err = lwmi_om_fan_get_set(priv, channel, &retval, false);
>                         if (err)
>                                 return err;
> +                       if (channel == 0 && priv->fan0_input_fallback && retval == U32_MAX)
> +                               return -EIO;
>
>                         *val = retval;
>                         return 0;
> @@ -542,6 +548,7 @@ static const struct hwmon_chip_info lwmi_om_hwmon_chip_info = {
>   */
>  static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  {
> +       u32 rpm;
>         long enable;
>         int i, valid;
>
> @@ -563,6 +570,11 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>
>         priv->fullspeed_supported =
>                 lwmi_fan_supported() && !lwmi_om_fullspeed_get(priv, &enable);
> +       priv->fan0_input_fallback =
> +               lwmi_fan_supported() &&
> +               (priv->fan_info[0].supported & LWMI_FAN_RPM_NORMAL_SUPPORT) !=
> +               LWMI_FAN_RPM_NORMAL_SUPPORT &&
> +               !lwmi_om_fan_get_set(priv, 0, &rpm, false) && rpm != U32_MAX;
>
>         valid = 0;
>         for (i = 0; i < LWMI_FAN_NR; i++) {
> @@ -580,7 +592,7 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>                 }
>         }
>
> -       if (valid == 0 && !priv->fullspeed_supported) {
> +       if (valid == 0 && !priv->fullspeed_supported && !priv->fan0_input_fallback) {
>                 dev_warn(&priv->wdev->dev,
>                          "fan reporting/tuning is unsupported on this device\n");
>                 return;
> --
> 2.55.0
>
