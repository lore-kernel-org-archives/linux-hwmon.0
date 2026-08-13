Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DEF35975
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 03:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786591065; cv=none; b=qN2UlDTKqr3A8nsdyLPyRccD5/MjI7XpF7YlRR+/1a97iEqZFC+CNWCiP5lqdGGK9Rwx9Ww5eYrB70xvkaN5995+Wp41LVsR6mC7yMDZHbVWFXmLZJNuubk1iYfmFGgn/xwl31daXln3BdJhw5/zebRvK1GtleSpWTRflLqh43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786591065; c=relaxed/simple;
	bh=Ror5ekV6NusMwjV9h6NOZtGl2J7RE5e+U27bAX8AgiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omRSv1BIqU7EWpKVFh9WIs6h7ktUxhmuUpIZqAnPuLjDRHLUa+dsdX9obgDHr1+/kDm8faNPBA2cM98xj3KhzVSCQluHvHDL/KdlJIXQwDUmT/fnhmK/qsDegaJ9lgiODHzPY265GmRakI3crBcGekWqV5mGBa0PSI7kh3ZWcVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pIrd210R; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pIrd210R"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so2061564a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Aug 2026 20:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786591063; x=1787195863; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uP43cjB6XPbux59zlOlPBcrqNlA5Y96LJ1OJ5BALiUA=;
        b=pIrd210RjH09eyuTzwMwZX2tKqGFhKq8Rs/b/u224uEZvB7/F84629IcYbPVptxe0u
         rvx2uEabshnBN5t/GkpDwul0PBbUDr1YbDVycYnFUD64t/s20d9Zn/tl0RZJSzP6QSvd
         vpbdtBQpZA9lLkZgjMtliOgjShQTpgl42Phb5AQwTvw+x/OjH1XjAQBT5Tp5dNe3W07E
         1P70JFLFDtahbd6Y5f2f6m+cgnviwoazzuees9yf3AvDfBM/UEVytqm2d7W4bp2VxHnB
         9CvbX+Iz47vVAJKFBPyF2n3FJK5HzLesrV2xOPTulIiG8W4mT9/Hors/kDeFLV28ncQz
         +qdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786591063; x=1787195863;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uP43cjB6XPbux59zlOlPBcrqNlA5Y96LJ1OJ5BALiUA=;
        b=qc0k9RklMTQIihIzdBaUmFAiEJOkqhMwXLNvv4Uy+3wkTDlLcAqfdZyQTA+x9bQj4K
         xQ2yG8Dmq9xTJuCp9DS8dkiFQ7dnwpZaEJvcNeGKPtjNbE24vEKU9t862mFP3f/k9/yU
         LNtQkoEJLsSl1LA9BSVyy2Awx6cf/BRSn9BaUzsgfaK2OI7a/CL+iaALFoSNoVfYLOS4
         4sKroxiiwo1COX314ljNsBsvunXLtXg6HBHi5Qvjkf9RAg0tM/lAFc96CV+t+ngDpMbX
         My2XuJACuy0a+m9F9Z0562b5fJd67X38xz9cvKgs89PwC8UcnFIT+dx6q+GEufNpgmUW
         Y5Ew==
X-Gm-Message-State: AOJu0Yziw10LR8gHkqt7S8NsL0hFCjoVCGqrULhrqtoXZY3kW1qW7LLC
	Q6HZnDJn3lz6WdaizKr+0uA5zMmZBFTcy19xkiP9Iy7VsKL6K2PhhpKO
X-Gm-Gg: AR+sD13gOsufggibeFactYARL/XW17+VW734yPYZc7ZPS1Uy4RZ7k2W5Kq0ILWu/xby
	0i2uyEqJIe+VutZsDvUWyPTwpPpnCqM5kF9yPcIjqdWcTYqHPYwbWmQ3hpB78LF4NcU5dBkdEyh
	vbTz01XcU/IX7thmUzO8VumQpFIKHVbVT9hiqYaHPv5o0lLngEsLLvkT+iNo9wDRBqluUC7P1mL
	sH5QZd7Ek+rJ9/awTZP2hkFU2ye9X9DU55ItW7mgYGBOOEIeknF7kUgt3I4jvWJWBJdok9Fiju8
	aAvKvUwRIFSQMw1V2VAWMS6FhYr3piHqHAbCn0NVuDceqE749RnwpIXLYvGbTVBedEMqhhqP4dy
	OYfkCLBOikcHeufqBDiJRkgKMYn4tlqfZEgW1PHr7lyCtqgRusv/P3CXvD+6JcFvwcDMCZ+g8f/
	2JV6iwPwLMI618wJ9eHZ4LHXYsIETxZDpbFyPWh2gxGzMKQzDyCeoTYIogkPsQqVA440u6OlFTX
	g==
X-Received: by 2002:a17:90a:c110:b0:392:c868:35af with SMTP id 98e67ed59e1d1-3931e2c17f2mr3834298a91.20.1786591062834;
        Wed, 12 Aug 2026 20:17:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3931cd473f3sm1641735a91.8.2026.08.12.20.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 20:17:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Aug 2026 20:17:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: rahlquist <rahlquist@gmail.com>
Cc: linux-hwmon@vger.kernel.org, sergiomelas@gmail.com
Subject: Re: [PATCH v2] hwmon: yogafan: add Lenovo Yoga Pro 9 16IMH9
Message-ID: <68b8866c-72d5-4ae7-9a41-ba8985d672a2@roeck-us.net>
References: <0b6f2990-9ad4-4977-9b28-287f6dd65911@roeck-us.net>
 <20260812023114.131005-1-rahlquist@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812023114.131005-1-rahlquist@gmail.com>

On Tue, Aug 11, 2026 at 10:31:14PM -0400, rahlquist wrote:
> The Lenovo Yoga Pro 9 16IMH9 (83DN) exposes its fan tachometers at
> ACPI paths different from the generic Yoga configuration. Add a
> model-specific two-fan configuration for the PC00.LPCB.EC0 namespace
> and document the corrected mapping.
> 
> Tested on a Lenovo Yoga Pro 9 16IMH9 (83DN) with BIOS NKCN35WW: the
> patched module registers fan1_input and fan2_input, both reporting 1800
> RPM at idle.
> ---
> 
> Changes from v1:
> - Wrap the new comment in kernel block-comment style.
> - Wrap the commit message to 75 columns.
> 
> Signed-off-by: rahlquist <rahlquist@gmail.com>
> ---

Change log goes here, and you are supposed to use your full name.

Anyway, the patch does not apply to the hwmon-next branch. Please rebase
on top of that branch or wait until after the upcoming commit window has
closed, rebase on top of v7.3-rc1, and resend.

Thanks,
Guenter

>  Documentation/hwmon/yogafan.rst |  3 ++-
>  drivers/hwmon/yogafan.c         | 19 +++++++++++++++++++
>  2 files changed, 21 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/yogafan.rst b/Documentation/hwmon/yogafan.rst
> index 6876194..cd7206b 100644
> --- a/Documentation/hwmon/yogafan.rst
> +++ b/Documentation/hwmon/yogafan.rst
> @@ -89,7 +89,8 @@ immediately to ensure the user knows the fan has stopped.
>   ----------------------------------------------------------------------------------------------------
>   82N7           | Yoga 14cACN      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
>   80V2 / 81C3    | Yoga 710/720     | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
> - 83E2 / 83DN    | Yoga Pro 7/9     | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> + 83E2           | Yoga Pro 7       | 0xFE      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
> + 83DN           | Yoga Pro 9 16IMH9 | 0x06/0xFE | \_SB.PC00.LPCB.EC0.FANS/FA2S  |  8-bit | 100
>   82A2 / 82A3    | Yoga Slim 7      | 0x06      | \_SB.PCI0.LPC0.EC0.FANS        |  8-bit | 100
>   81YM / 82FG    | IdeaPad 5        | 0x06      | \_SB.PCI0.LPC0.EC0.FAN0        |  8-bit | 100
>   82JW / 82JU    | Legion 5 (AMD)   | 0xFE/0xFF | \_SB.PCI0.LPC0.EC0.FANS (Fan1) | 16-bit | 1
> diff --git a/drivers/hwmon/yogafan.c b/drivers/hwmon/yogafan.c
> index 605cc92..6cfbad3 100644
> --- a/drivers/hwmon/yogafan.c
> +++ b/drivers/hwmon/yogafan.c
> @@ -71,6 +71,17 @@ static const struct yogafan_config legion_16bit_dual_cfg = {
>  	.paths = { "\\_SB.PCI0.LPC0.EC0.FANS", "\\_SB.PCI0.LPC0.EC0.FA2S" }
>  };
>  
> +/*
> + * Lenovo Yoga Pro 9 16IMH9 (83DN) uses the PC00 namespace and has two
> + * 8-bit fan tachometer fields.
> + */
> +static const struct yogafan_config yoga_pro_83dn_cfg = {
> +	.multiplier = 100,
> +	.fan_count = 2,
> +	.paths = { "\\_SB.PC00.LPCB.EC0.FANS",
> +		   "\\_SB.PC00.LPCB.EC0.FA2S" }
> +};
> +
>  static void apply_rllag_filter(struct yoga_fan_data *data, int idx, long raw_rpm)
>  {
>  	ktime_t now = ktime_get_boottime();
> @@ -170,6 +181,14 @@ static const struct hwmon_chip_info yoga_fan_chip_info = {
>  };
>  
>  static const struct dmi_system_id yogafan_quirks[] = {
> +	{
> +		.ident = "Lenovo Yoga Pro 9 16IMH9 (83DN)",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "83DN"),
> +		},
> +		.driver_data = (void *)&yoga_pro_83dn_cfg,
> +	},
>  	{
>  		.ident = "Lenovo Yoga",
>  		.matches = {
