Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E9526ED59
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 18:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783880834; cv=pass; b=Pyah0SFF2/ZtmnGTnCo3ApzKWw4laWVb+1yL5WrIwIax5jPZTgdY5TA36x5l4h5OHWv+sDjlMFEHQsK6at+VG3qVoav9/A9H4j9wRpMocd5FzA1kNiI+BjQd6CxmEFMtxOljsBBnSiGAaP/AxTu38FA0BKIhiSnhTjDVUfiL4FI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783880834; c=relaxed/simple;
	bh=xTn5udW9Ps1gO94zbWtuuiNs5yNHsywEawLvyIwAQl0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cBUoi5Upkc6LWxHoBGyhxa9C7xMJcWbCJIdiQoVET99ufyesWWKm5DmjMx6acDA5A9QNVnlYwu6o5yyc1rgWoFqAsBzjrBw+S9rKUaAsUXZow88zWzpeN0IxXVOnQbGI4nsy+91Zu9hRYJ/hjE46tdk/ohcHaNJaCGquPwPqetQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awSEWMfq; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awSEWMfq"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so1862592f8f.2
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Jul 2026 11:27:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783880831; cv=none;
        d=google.com; s=arc-20260327;
        b=s3T3LIyZpPdzHu+og0mGn1NhRghWqbjmNLIevrbZxwzYqD9YJ7Wf4wUzoC8wHsGW7R
         i0WuGd3dI4lu1lHORnMx9Tg7NQtevP1L8x9FdFkHcCnUUlkErflYDFrAgq97gqM9Hg4M
         AaO6Y2+AIephlY92yXF7VEm3bi3F8dEdIBmEU6xXsmvYaZpEwDHN16EOq7cywGCE2L40
         Op/FqCgXI03fG8B9KcvbDdIHsFxp54Mgr364id+KJGLidlZiTJ7PeGkH3zk4hYnMcwP2
         gXhtRemxAhJ4HuR6tUg0RjTG2PAiRfMKFPpULez/rpnEVlVDXXaqfMR6BFlqQKaPMar+
         yBwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gRo5Q+vGEss6ysnNHDAXlnatgfj1XHTtP5AJ53RippI=;
        fh=gG7pg/koKz4OoA5jUjiW2s6qfCUHFz936+B4Lj8qWqA=;
        b=Vekp0VuC9fVDQB958vhaw0LaJZPGSNoAwbVzBWYwPKNnQRfGzybecGfZQ+cOEHXoVQ
         cHrzQ2el/ZN+8aP1BzzxF/1Rz6GeIbzXburNfFZxXcaoOdxIXx5fKXW6bglHYcygV+UY
         C36MnSIZkVpUD1xCcvyddK3IifvfXk++r677fScNPBMJwL1aLJt4+63IhSgT7N6aboCD
         xMxoIAP2gbJKHDb288ISCNbvN6q1MXp12I0r7zdG/JLc848K8nFopf++oBXyGz5S0Nko
         t0+tOpqr6lsj5jybrbiASiEp1gera+1AhXHkNvyTTSQ8K/Bj/JbHCguna7Cy4BdX2Pc8
         bgFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783880831; x=1784485631; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRo5Q+vGEss6ysnNHDAXlnatgfj1XHTtP5AJ53RippI=;
        b=awSEWMfqQoPlvhG07IfSF753xlISbcU9nGQ3n2d5uY9c2u4mlqY9an38MIoJLq3r0F
         gmSlSyGt5gy1CgJuwJG2dIC4SgJG+xISd9RYQkbZaDMYYmPu2Cw954IxCCHIpp4aQUYt
         iZ8qc2d4wc0c8txVE676lV5SN61k2femD1dXw3GyOH1g9miER8qD+z9REl7n1S6+h42q
         URKTGYTSqdeBbvDmRUahPlpcb2Uc4FdGUEHE6r18FjQb4Bh4Y8YpocQFfHKUlqc0Fy+Z
         OaTyPCxQjVgZOJgW++E62E8KjRfNrphlh9zjNe5yQ5hFayEKs/8VvRwPtV+yoOlAiRv3
         VcYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783880831; x=1784485631;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gRo5Q+vGEss6ysnNHDAXlnatgfj1XHTtP5AJ53RippI=;
        b=Q2ZxtCNLUkT9KuWJJ4sJMoKpgADzTgDuy4jfmGYdPW33fuWJEcVhqzmig5VQZ2vyLt
         OWzefvzZel4hyVhDSwk0hY9dl5zoIqF543mKNbTwib24qc4c5bdCKmxrafFrywOqUBhz
         jnGy0e5cCGeYiyPz82jCSFRQL/+zJEwaQmtmNgZDdMcqhSLcUk2HNtqoT3lE94EzEM1B
         KvLLAqz5VxsbGphkBTNA98IdGQ2FQoF5DZ27+DywKnmmz39sc2rPD+Vsm5aznwEEUIDQ
         KiFAjb0XEUkUgdAD3Ikgd4RzvVQ8Hz9AYkxTQt0xq9/tG9SAI0WFNYnBYb/jjMpkWZKf
         muJA==
X-Forwarded-Encrypted: i=1; AHgh+RpgWvRB2YSnRt81/woRF/OUj/FcryEQZWT7qxwY+80runymnrPUmOd0cTHaeTvECY/YHs1+x8BxY827HA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/toIDQwo8EI1b2IUu0B7BgQjVP0QxScM0seZ++LJEr5nAABn9
	tYHH7iXmKExuz9DTeE8hf/IopjMkDksF9Q+w9A8JHBLC4cL+ST9DVFGPlZ9bW+Uo1irAFhgXgxU
	eSGt7mNgrYcEYPFK/ybf3NvG2aD4k0M0=
X-Gm-Gg: AfdE7cmiXepweUp9ynWkUnALlqTCMJNoaUChnwT85levfhls2sopu8KrX/ZePPhhuVH
	N5/cPi0vMcSawy+bGE99Uw4gbcCkpDxdGmXn19deF2h8vDY4NuElZquYBjtQdMDEi3FXvmEI8xe
	FlI44WpGhPE8qy4OlxodRhrj4TnytLcUAHLkAvWmdH58kyf00+rT8WfyZWa/JmiOI+g/P07R+TF
	DII2ly4G34vJ4idW6Yuk/xQnIHukvrApuCOXavvJKZzo4pCJz2SxqhIDjf4WXKicxUs3jNCcoWs
	u/A3XeyEiVbxKl3J0uDkPqvxqml5Rm8kmQAyexrqg/YEG+/ZhgTIBpWrFaJE9XW7lcP54TF3szw
	BvAMxiSBnjGWVwANLr/g9DEKf7kNqwsnyUuvsbkaBSBhaZDp8SEjyp91JFzbA0Qj4ukKW4bJd9z
	cQWMfp++13nudMM0pE2WxMYWI+Wlucf1eNIw0iElheYcmCLqfr
X-Received: by 2002:a05:6000:607:b0:472:f8b5:aaca with SMTP id
 ffacd0b85a97d-47f2dcb53dbmr6684892f8f.15.1783880831109; Sun, 12 Jul 2026
 11:27:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712-add-string-choices-dme1737-v1-1-9c2b1f31db28@gmail.com> <fceb5317-8dca-4aeb-bd01-e7e1c9a65ab1@roeck-us.net>
In-Reply-To: <fceb5317-8dca-4aeb-bd01-e7e1c9a65ab1@roeck-us.net>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Sun, 12 Jul 2026 20:26:59 +0200
X-Gm-Features: AUfX_myEogCYbInfInTwIGAezPEpOSNlv6f7gaRYfI1bG2Ny_WntR2s-Zyyrmu0
Message-ID: <CALoEA-wf=gHdmcA==SUu0av5sDUYpxnTpv2Z7crKaZ-F_RpL6g@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (dme1737) Replace ternary operators with str_yes_no()
To: Guenter Roeck <linux@roeck-us.net>
Cc: Juerg Haefliger <juergh@proton.me>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 12 Jul 2026 at 20:17, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 7/12/26 10:58, Joshua Crofts wrote:
> > Remove the ternary operators and use str_yes_no() from string_choices.h
> > instead.
> >
> > No functional change.
> >
> > Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
>
> This is an extremely old driver which does not support the latest
> hardware monitoring API.
>
> Please refrain from making non-functional changes in such drivers.
>
> NACK

Fair enough, apologies.

-- 
Kind regards

CJD
