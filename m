Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DDC15B971
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 17:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768669927; cv=none; b=sBZTGgfPJh7onpS4+xIZC3/iYxpqOe3t6W1PMGKAZW2Im29nNLxnT7g8xYfYelweFGUaTry1YOO0b9eyqCrD1l74MMJLuPaCZXDD/skKLtJOU/PRQRZJ7lMFM927uIH8uVsbtRAsZazi/56EnaYqa8tshky3AxmB0akwZT0AbSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768669927; c=relaxed/simple;
	bh=wvTaqFO+s6licz/MFAV7eYmeiQy7eeZ43sRF6lQReVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BEBPBdLyyJb5cJ1/QBE8+S+IvIbZuemgYOJOtisc/6r8t3aBR/BhgBFlikkVFfIctd7szLtcM0S61KnKM1Gxf+qU/I4WBFWLk9f2nFQ+mDEdjTW8tgaGyUUW8m0prDfGtGjaerB4FeQkl5C077/uoGFiLj1gVw77CsLeGn38G6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i8FCae1t; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i8FCae1t"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4262831eec.0
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 09:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768669925; x=1769274725; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5KPb8zq6iWO6VM9fNSIaAaVd95Ujdds3oIJSYrORDo=;
        b=i8FCae1t+clM/GIPMj3SuVq/+zALkuglDh3aAR7lZewtaJhONiD+hPLTo+J7WOeujU
         j0zTELFeipMsmPxc1CQs47iqWJrpZ+QWI9T5KBhkrasTFcTVJJbFXyxb0qFQscT05edr
         Hyd5EsyVasS5cmhvPvJy7FUbqjC0Sn9GjZZG3uoAK9OikmE6HGKMPwQtdNIxxhPjA+mG
         JJoPrGiTltCVbNDrfsQVSph/njyYCBGClqZaLkpCSCra3NIgD/Allvy50XVeFs7Hh/Jg
         rZJFNNtn/2XlsJq97M4m/jq+Sp32WKQ2gDG9EoeGr1UA+d/b1x80s/j26et62gqZQaNW
         lKuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768669925; x=1769274725;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=X5KPb8zq6iWO6VM9fNSIaAaVd95Ujdds3oIJSYrORDo=;
        b=So0G6WQS0Q6Kx6GDoeugWwbI84nYbKcH2KEN3CUfsXAcM/Wab7voTFgXBqjpE8Jzk5
         q4Qt47ezoF26FtydMwqVKSGufjucQxrvdAksj8H1G3ltQTDqpOIsl54Azuqh/1S75ZE4
         RSBIhCOgZDno8E5pB2CdbbQXhj89H7IeEmCfzwLcQCzeKOnEi2EgwCCqgFT/Wk2KBmj1
         +FexiM/4z49w7cafptsHlxk2mX4pYaMHt0uRhOz+CSRmxncGAUCVEqkvk7umgYobm9Yb
         UNEmvfzQNfkKrGhfLS1cZSTReNpR/sO2F64GTC2kFpavYjV5L/2Orn36WaPan6CNE+Ft
         HAsA==
X-Gm-Message-State: AOJu0YzEzCiklUcWVmZqaPeudZKR69jOsdukQ6UuuCkq5ii1g/pfaD+Z
	3/hL+TpkGy6a2oBuKA916dmm8DVEzdKZ34aXGqGmnY7XG7dPju7P3jtP
X-Gm-Gg: AY/fxX4YK7KjXTZtSx8G4hLuUo7LCc6Kcyr1ICxqUF4ASZBe4w9Csv6bLwflbIhiW8b
	s0jKIf7yHMEUTSvlDfwHnhpOhL9YXPk50PBIR6YWyVzPg4uIq69YKPESpdaLRVe4bZrMNP4Utvu
	zS+PYYy1iL46FfQR1Bgz3ndgR4SZSGVugahtghstc4XvmvI1qMckI3TLhKzsj56Qr0LwAuofqVD
	QV/pG7M2zt/XrIFjm9pdYyTGOX9+GfrakCvVghGv+R8ZytwQsJhwtkz8NkBvLFk4F7hCDtV74dO
	Jsxb9tF8Y5/ZmvJkrP7HpnYg+oLLQoO8KvsTcXNCFyI58Nqt6o6ASconc0xdZ8AMqFNMY7MUTon
	qJs1KzlDAdvUofSa6+N3TLhVKjfU7gQU9vppNlPfzDUKlSib1En9UQO1j4DoZ+rq2BMQNCgoo+T
	D4KkNykqaXUSi/Y6Mx5hZtmOwy
X-Received: by 2002:a05:7300:5724:b0:2b0:4965:8829 with SMTP id 5a478bee46e88-2b6b40f05f9mr4639528eec.34.1768669924294;
        Sat, 17 Jan 2026 09:12:04 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b361f5c9sm6432699eec.22.2026.01.17.09.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 09:12:03 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 17 Jan 2026 09:12:02 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: leobannocloutier@gmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	pali@kernel.org, Armin Wolf <W_Armin@gmx.de>
Subject: Re: [PATCH v2 0/1] hwmon: (dell-smm) Add Dell G15 5510 to fan
 control whitelist
Message-ID: <700ca7dc-bf7f-4242-a64f-ab593aa78b9f@roeck-us.net>
References: <ef59dcf1-5a53-426b-8c17-00ddc8fe5d11@roeck-us.net>
 <20260117015315.214569-1-leobannocloutier@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260117015315.214569-1-leobannocloutier@gmail.com>

On Fri, Jan 16, 2026 at 08:53:14PM -0500, leobannocloutier@gmail.com wrote:
> > Please consult Documentation/process/submitting-patches.rst
> > and Documentation/hwmon/submitting-patches.rst before submitting patches.
> 
> Thanks for the links to the documentation, I tried following it as much
> as I could, let me know if there's anything else I can improve.

Well, a start would be to actually follow the guidance provided, specifically
in Explicit In-Reply-To headers. It says:

"However, for a multi-patch series, it is generally
 best to avoid using In-Reply-To: to link to older versions of the
 series.  This way multiple versions of the patch don't become an
 unmanageable forest of references in email clients."

and to also follow the rest of the guidance. Since getting kind of tired
of having to explain this again and again, I submitted this header and the
actual patch to Google's Gemini AI, giving it the following directions.

"The patch in file patch.1, with added explanation in file patch.0, does not
 adhere to the guidelines provided by linux/Documentation/process/submitting-patches.rst.
 Suggest an alternate patch description.
"

Here is what it suggested:

   hwmon: (dell-smm) Add Dell G15 5510 to fan control whitelist
   
   On the Dell G15 5510, fans spin at maximum speed when AC power is
   connected. This behavior has been observed as a regression in recent
   kernels (v6.18+).

   Add the Dell G15 5510 to the fan control whitelist to enable manual fan
   control and resolve the issue. This model requires the same fan control
   configuration as the Dell G15 5511.

Key Improvements:
   * Imperative Mood: Changed "I copied and adopted..." to "Add the Dell G15 5510..." and "This enables...".
   * Removed Personal Narrative: Removed references to "running a system upgrade" and "my personal laptop" to focus on the technical problem and solution.
   * Descriptive Problem Statement: Clearly states the symptoms (fans at max speed on AC) and the context (regression since v6.18).
   * Technical Justification: Explains that the 5510 uses the same configuration as the 5511, justifying the use of existing driver data.
   * Conciseness: Follows the 75-character line wrap recommendation for the body.

Please take that as suggestion for future patches.

Your description and the updated description both suggest that this is a
regression. So the question is if that is indeed the case, and what may
have introduced that regression. Please confirm that this worked with
v6.17. Anyway, I asked Gemini:

"The patch suggests that the problem is a regression in v6.18 of the
 linux kernel. Analyze changes to the driver since v6.17 of the Linux
 kernel and identify the patch introducing the regression.
"

and here is what it tells me:

The analysis of changes to the dell-smm-hwmon driver between Linux kernel versions v6.17.8 and v6.18.4 reveals that the regression was introduced by the following commit:

  Commit ID: 1c1658058c99bcfd3b2347e587a556986037f80a
  Subject: hwmon: (dell-smm) Add support for automatic fan mode

  Root Cause Analysis
   1. New Heuristic: This commit introduced a heuristic that automatically exposes pwmX_enable sysfs attributes on Dell laptops even if they are not explicitly whitelisted. It does this whenever the detected maximum fan state is less than 3
      (which is common, as many Dell BIOSes use states 0, 1, and 2).
   2. Incorrect Mapping for G15 5510: For non-whitelisted machines, the driver maps the "Automatic" fan mode (value 2 written to pwmX_enable) to fan state 3.
   3. Maximum Speed Issue: On the Dell G15 5510, fan state 3 is interpreted by the hardware/BIOS as "Turbo" or "Maximum Speed" rather than "Automatic BIOS control".
   4. Regression Trigger: When the AC power cable is plugged in, system power management tools (like tlp, thermald, or desktop environment services) often attempt to reset the fan mode to "Auto". In v6.17.8, these attributes were hidden for
      this model, so no action was taken. In v6.18.4, the attributes are visible, and the attempt to set them to "Auto" triggers the driver to set the fan to state 3, causing it to spin at maximum speed.
   5. Confirmation: A follow-up commit (1e9cf600da98) specifically addresses an off-by-one error in the visibility logic introduced by this patch, further confirming it as the source of the behavioral changes in pwmX_enable.

  Whitelisting the Dell G15 5510 (as proposed in the alternate patch description) correctly resolves this by instructing the driver to use the model-specific SMM commands (0x30a3 for manual and 0x31a3 for automatic) instead of the generic
  state 3 heuristic.

Copying Armin. Armin - any comments ? I am concerned that your patch
changes behavior for an unknown number of systems. Adding whitelists
to address that on a per system basis seems wrong. Any suggestions ?

I'll apply this patch for now, but unless there is a better solution we
may end up having to revert commit 1c1658058c99 if some other system is
reported to be affected.

Thanks,
Guenter

> 
> I tested manual_fan and auto_fan by using `sudo i8kctl mode0 manual`.
> Manual seems to bring back the expected behavior where the 2 fans follow
> the fan curve described in my i8kmon.conf, while automatic brings the 2
> fans to full speed.
> 
> Link to v1:
> https://lore.kernel.org/linux-hwmon/20260114020108.83288-1-leobannocloutier@gmail.com/
> 
> Leo Banno-Cloutier (1):
>   hwmon: (dell-smm) Add Dell G15 5510 to fan control whitelist
> 
>  drivers/hwmon/dell-smm-hwmon.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> -- 
> 2.52.0
> 
> 
