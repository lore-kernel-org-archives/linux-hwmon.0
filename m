Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085C64A32
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 01:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200906; cv=pass; b=dJdv15dsmFpPRfqdWE66mwn+X5mqR7tMegC22Ui/jMr4p3pzlrZ1bB3btrHZR3dSZJtVkm2ZRXKBJUn2p9CeXN+OKr8GtOXu/5b+D+9aVFR3rVpfbO/ciD05VAyrYuwmGGf2R5fO6Ppa4y4zw+sRapeiibimSow5K05XlG72SJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200906; c=relaxed/simple;
	bh=ILUDOz3OtD79ah8g/4D7a2kZLUCPIh5m7nzjtQZ+ZJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RYQUj7Pm6MlWKSRngywYjSpUr147ahZGaFS+E1AtCv1FCIx5PTqeOmt2wuFXNhoTJ9+bL3UkODukOgH6fyxqsNoRBB+GpJJKoVwrdXibifs77MIXGT2gyxSNoL3C6F2qjt8CEQBiVtbkhPf1J1t06z+ii09oyJvMoi2UbZ7Yomo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vi5fbnQK; arc=pass smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vi5fbnQK"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c1f5208b38dso212143366b.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 18:08:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785200900; cv=none;
        d=google.com; s=arc-20260327;
        b=kUjy3faTgeehitn8+XavONLw/aCGiBSaMxY7/ORAlPVqBXsto9WXmTHNlVP1TU9n7R
         GvkrDIuCWl+wqoeaS2EkQrkszpjtu++x2DpA0bydokNQs2FLBWrXHmeOzCm2yZYvvS8v
         mJYib28FI5shlkWehHGU5yNzJUuY82PaHBRsmIsVfhhYfH21GCyK+Pv0xF0vlZDTdAvd
         PA/8rDtsaJUQIGGKBQ1nCOrkl/y+cIXzjwIwLMbDAoCdEakUwSjfeAFEcn5kbBV9OV4e
         QN0UF7aB9BmLIlJB8XvofY7lz/Lk/fPjkEx1Kql4dKbMoVSI59QAhjSdwX6Aq5vxAdAA
         vaVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pr3TVEFbCMkz+V4kwGiYWUEtwmc+YXchYxPAcsjLdaM=;
        fh=Dl/wb20UiiqQBgvhlXildhZxkvpNcHJXMm8bSPbOHv4=;
        b=FhaysLR7PxyHL8qQDTnA3/4bnuesvd/AA1WhYhstwlJrZ8Dx4prERACbSW9hDCDshA
         4GedU/xPCWrbrF8rDnFWDfiLCYHtWeIhMFLFC+cz0B+4Zwzz2F1Hdupyh81lHJi0lZ1T
         AvvPkr94JtYnnTKO5EhWXgTxp92SOetdThAu1et6i+lk0xvTM0pQD52Ie5Pt8PKucFQe
         F0JDFRu7T1GUFh6Opxch4Is4qOCSSsU1mc/gd2r37AvJEIHi4nq1aJ17PozpcDP82l7c
         oXDvdXsrz88bDCOW0X1WMUANBfVL70DClU2iZATuEday9s6on4lGcBOHmNYWjRNTVNRy
         YbXw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785200900; x=1785805700; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pr3TVEFbCMkz+V4kwGiYWUEtwmc+YXchYxPAcsjLdaM=;
        b=Vi5fbnQKk2L1vhtrZE3Ss5gUTPeFd/HYLl26u6/zfnIeajPoJTNCW5cfXkL1eYGTG4
         xC4BcodAPk0TIfQcWeEro0DJJV7A3NLEY6Y9fwXE+Q8wTCTVhSVUISCBRxXg7625Yp4Q
         U7ROld1weB7xiwf5AhFz3I0LzzHWTO4YISzPQIDMCYyFK8F+PHBMFA/FjVKmfstWBx6c
         /en6Ac4FBhswo626bP1hv2w3QdZ8Aj6Yx523cq0P7n4c2rh31fKenEWkYv19LoqjLAfX
         HCzXAr4RYUKPTvEsZO1ImyxC1MYYzhvhOIni28ZqogqT4CrkOniA3y4F66sB3HY7h098
         hFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785200900; x=1785805700;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pr3TVEFbCMkz+V4kwGiYWUEtwmc+YXchYxPAcsjLdaM=;
        b=aAnAJN6pVZVLKKvllT4cG6lD74ZCoVM/JRooUBme5ko6h3KbI2mY+CWU77+awRw/Fl
         CFylk8ixFuUek2DlizrhUS/183z5hCVav03WfE48tUfSWVGqEal//DiFMHHMAhaMCqnk
         6nueyKAGh3HOvnHR9Gy0j8gcDJMkq2NRFsuK6lZdYUCgE2/9gv53H5Ncc5lCLHcRPDgB
         J/OsNWN+tJGyconDyQYVzC2Za6Sd6z/exxgKpx1PGv1heBhlNqCfYTj2cYpGyfadiyBz
         XZFs6awR4EPeBrz9R+vGTRkuthd/AMUDRKXiWMh6QTRye/W3eKgCeNsL2V0lnXEx/ca7
         eboQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdAAp89HJehCReyr+x5OS6ktRPT/GWZdeBdWIFMkuHbET0nN+g1LP2HE+IMXZBZ+C1x57rCmHJFqgTUw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVH/W5mXtAYBdLqN9t6l+Dm90opEVM9OURz5P+xTwNXv+BJnA+
	Y3B9X365ia0w5Xzt2uJN1wdGpkaHWJPOkvBlFed1BLc0KNA7AbaAys3FOBYXkEG6OonmIMc20SY
	PhlzdXP8zyQpzQxSJcElIoMfCflVL+q0=
X-Gm-Gg: AR+sD12cTuld4JD+0PPol0eD8Ke4GnvnoRS+Jq3xNGE1G3gHyh+DDetrFIXgB4wPNd2
	yGQBf4Kr5A/iqul8hMr3Nc+Ap3iMkMx4voUVfVdL8VVYT/BiQJ4H8kVQ06TUen66px9hXkzKN22
	GlQ+v740rX58v8o8pFICuSy6oNKte7lM69RDke4D9pGzgTMouTprYO74pHiTfQXIxGBzKMBillP
	b6AQdyguuE52HPLZ2NTKhherbWQr/bwcpsb/PHp5yHE5z4R0cpXxxT4SAxNKp+QQrUCiMZPL+Qr
	3FkUi03eU5unku1SUzD/jkSo4vzbIQ==
X-Received: by 2002:a17:907:3e03:b0:c15:fc5b:6884 with SMTP id
 a640c23a62f3a-c1f71cfcdfbmr7961266b.13.1785200899455; Mon, 27 Jul 2026
 18:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com> <418c14f2-2f89-4ebb-99ed-1f7326a811a8@roeck-us.net>
In-Reply-To: <418c14f2-2f89-4ebb-99ed-1f7326a811a8@roeck-us.net>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 27 Jul 2026 22:08:06 -0300
X-Gm-Features: AUfX_mz3Fd2JKHWGRMyJWomXIAO4TNKonIWPX0dUbeznQc8oScxwk6V9psxQS_c
Message-ID: <CAJq09z7ZPe668c0wh+0Y4yGPdrCccZNuqJ8Gf8WATK16SGen_g@mail.gmail.com>
Subject: Re: [hwmon PATCH v2 0/8] hwmon: (adt7470): Multiple fixes
To: Guenter Roeck <linux@roeck-us.net>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	"Mark M. Hoffman" <mhoffman@lightlink.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sashiko-bot@kernel.org
Content-Type: text/plain; charset="UTF-8"

> On 7/27/26 17:22, Luiz Angelo Daros de Luca wrote:
> > This series fixes several issues in the adt7470 driver:
> >
> > - Restore PWM configuration after I2C failures.
> > - Avoid cache corruption after failed writes.
> > - Prevent busy looping when auto_update_interval is zero.
> > - Fix incorrect temperature alarm reporting.
> > - Cache the PWM frequency and fix error propagation.
> > - Correct unused PWM auto-mode mask definitions.
> > - Fix TOCTOU issue when reading fan data.
> > - Fix PWM auto temp state array corruption and missing bounds check in
> >    sysfs read.
> >
> > Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
>
> Thanks a lot for all the fixes. I applied the series.
> Please feel free to fix more bugs in the driver if you feel like it ...

Thanks Guenter,

> Note that Google decided (again) that my e-mails are spam, so you might not
> receive this e-mail (and the others stating that I applied the patches) directly.

I'm safe. I created a filter to mark all messages to me that mention
@vger.kernel.org as non-spam.

> Guenter
