Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E5423BCE3
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 00:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780878342; cv=none; b=Fnf9kfeNm93yftxI4fzM6Q7vS3ipOjcjlNU/SvuMkF8pBCvH8ven5zv3eIgvW6ilodhlOo6C9JOyPj4Q3Uec/gZ8OwK5hkUHs5pGHB9lR8tT/PR7MTsNenYsLfDN3lBLQ2Rir1WkRdxK4p9sh8CXEWbF8ewy7mSO9D9V5syWE60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780878342; c=relaxed/simple;
	bh=ECmitdEydk7PfFA+T11X3E2TOA9POkpKjgNGjZ4Bt6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zza7q1tjXScEgFyTfPTi/SNhUCwlhkqVOUge+7g5BwB1AqrUq/TXDmnzgqK6skON7L9vGoKxzRjDs+/s79BdVpazqVK16d5OyHuymr6mpmphY5zqJHh2M5LTLGcDn05JNKdZOCv6QiqB20sAarleo4NLNaPYOJYGG52FoLQaDv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kbuhd5NF; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kbuhd5NF"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304f0039c02so6788389eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 17:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780878339; x=1781483139; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lBbnG4OA1SFUaywwzjakTJaWMnu6oFLOxfH/aGfZX7A=;
        b=Kbuhd5NFZMnsxZH1he4tPKvfitwPlYEjnQVzjd7IsvDn809CnqpY4VIyf7Z7WCcCnr
         fMejttPGF6iWkCTrf/J5xNAEsQjNt012xNgNxUrjGagikQUiLIKrsHE+0lOU+XWTh3xm
         FShXD7PALAJUkiOxHMNFQLtoYVxKe3wms42HZ6qUnkWSyw4dwusMrnY/t8wga7s9nXh9
         YWPOHD8zTUt3FCJgP9Sj5fDGURL1yOrg1nrCstfNkUl/znGW5EyRKcE/2aMtcK/hHuoJ
         aQedsxp3nsujBDf2g1j5SMCbM0LSJFvUtd/ybvQl2JeZpk0yvSAhE0wDZ7ELLxu2EZ2K
         6LGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780878339; x=1781483139;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBbnG4OA1SFUaywwzjakTJaWMnu6oFLOxfH/aGfZX7A=;
        b=OKLrQuB45ajpWf5ZOLYoiXztRQkYJGQvM4xlmw5Elbu9l4axU/T6qrt3m15ThqM4BF
         nc6NTKNnNh5iYckzMf95meXvLcDhCLl1JLJopel2axeCQ+Cnr3/x/tbXeFgpu2hX4Dor
         xT/irdutvZ9grEiwk1j0lKzpE3uafbnmeFvZZFdQJ730hOeWubOHV8LEfLgjbhCdB1nZ
         KpwxrzduUOiv4J8v0WkGCyOPlWEoRWIJb4k2LbuCoSDYPCBxg95+oTFZj1XAV40WBAtD
         WfoOOIAMkOUP5a2B0GaF3FS5ajbOJJ01G2G+0QZkTGRN5PcPhY5IVDnKDImzEcVz2HeP
         W/Cg==
X-Forwarded-Encrypted: i=1; AFNElJ/XTAdhVNQAGpj887sNnkP5SFDOcxQzdlDkn1S0MmaspFGbwLNvEa4nY1la168XPWXM1kI7G3fldGqEeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyoyDK/IV3xDMZBBRkuVAVh0Z9Bkjcd5/+z9A0CBPJad12xB6k2
	Z54NYR69PU2w+JOMTS8r7vs2dFhl4BQVUtRB/PpXyot31Z3dSJu1gFCc
X-Gm-Gg: Acq92OGVShhng2G7p2pU+hQhvUASJ0n/i4DGa9bm2AD+1AerCo4hEmkLCH1gsMrSPm8
	B+4FjjX6UhVLafSsIAKSGuWT65yxY3az/4n9YG7gOgFcnDCI8n/nb4YYMek5a/8sT2L/wEq1bcY
	ZgKRLPrEDg5BJ1G9RQqDCgr32OGZFJrLree4ceQojuA4ctblN9GeZj5chcXRnCQX/7FkLomY2dL
	+Qvk/Pen92ak9kNNOiMyxXFSWhHuPp3h54hVhSmxYOV3h/fS+WSJlArxaeLTCi6tn1uY1KBOfx0
	Ke4DoXhm7vF0nAhAS/vrFq6/3jzsUwuEHh3tFCJIlu6Whnbj1OSGY7KpijWxigw06Lj1LsPQDjv
	tORl5NNmw8MAllnD2eaNdzAKMZMzEoKIwCrba7wIKxcH+zTV6q62z2SVpzA5iLRW6NFIhx8p4kF
	biS6eUJS9Czv5LVk1RiCJXGlgMSMrPbuRX9tbcv2aztqkZhCc=
X-Received: by 2002:a05:7300:320c:b0:2ed:6f94:9d9f with SMTP id 5a478bee46e88-3077b2e0c15mr7274403eec.11.1780878339457;
        Sun, 07 Jun 2026 17:25:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db528dcsm18069989eec.3.2026.06.07.17.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 17:25:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 17:25:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Benson Leung <bleung@chromium.org>, chrome-platform@lists.linux.dev,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] hwmon: cros_ec: Drop unused assignment of
 platform_device_id driver data
Message-ID: <fdc7befa-1bd3-4689-ac20-2691bc202cca@roeck-us.net>
References: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
 <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <972c9998054c7944f63266819d6fb08b36edb5c5.1779894738.git.u.kleine-koenig@baylibre.com>

On Wed, May 27, 2026 at 05:15:52PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> The driver explicitly set the .driver_data member of struct
> platform_device_id to zero without relying on that value. Drop this
> unused assignments.
> 
> While touching this array unify spacing and use named initializers for
> .name.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> Acked-by: Thomas Weißschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
