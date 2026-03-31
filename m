Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4EB2EA16A
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 10:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774953611; cv=pass; b=eT7qcuI4dJsizRxhiMVs0qHLPsSeBlS/xhFO3AIzLS+lA1OGAycmt8ypdb4MFBbHmgZikw5hHWAoxUZXeWCfe2Sql27PI/Vww1nJPSjQRY7dDBi/tJ+rU7ArbCaKyOyltGojJ5ynjFyvSJsloATcIBY1xlyqdJhZKTIr+PxIfeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774953611; c=relaxed/simple;
	bh=MYFut3Rimd3k8Z3yPFdcPvHQ6xR0uwimzEPomoUeqCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=krCWxXqaBhWCQ+kit1Hsy9REFfyBXszoiYgnkT+uMdq2gayx1PB8pS7fp7UlEsoVNv+5TfbITiwCC0PRlmegnJVOJpCBL4tDOKsmFmgIJxiV86kYr1qEhoAf8hLtlujq/8ks0BVM70YYAe1lGMa+H6sgLi9oAmRbeWn5HiU/mq8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z4jyZ0CB; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z4jyZ0CB"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so53805215ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 03:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774953609; cv=none;
        d=google.com; s=arc-20240605;
        b=UhmyKgNBxsDt5MchlB/I9QweY19fUqu5NKICGUHddJmiCAwj2w1GIDScIO65MporaL
         k2FQUO+KNu18XFSvezuYnjfRkBC9Qg+fsGMUZdSsi1gSwKqEGQhjaglb8yJtubtuQ/kr
         lHzYXtCUKcLDzOwUpFCtPDP+sUBQUoOhQHS1QQ3AogtY/lftM8p09TLsidAIxF5w9qg3
         Yg1XjrcqC6tFHLqjkKzBShrSxe3m5AJG1LMb/nFM2d1kAR/vmyySl6tZZJmiegZIxgM+
         /3BND+f3q7nOUs3uRfMweBCFessddCA3MF2RGyo98OtdULQ2aqgqtDKWynK7GBaRMWQW
         Wmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4eFGFBleCM1b66t9OFyEFVeyirGx0X8tI0bngKzp0rs=;
        fh=CGoa648iVV+pBHN1DJ33s5AE6EyezwM8LdGDRVs/Ac8=;
        b=FZoUPBBFDLV90cix+n9YI8nvikoY6WaK58xYQv3/4zEeB+1hIfdPI7fe1gWeAqBhrx
         m95nx52PxZ1r0uZ1+xyWGALVjBqMlxGeHwRaJbymJfHioZ0JJXry2fYFJCu85PzKCndm
         YExemYvyHcNG75HUkMdRDekR2fHgVr0QBnrXtZBrz9hPsYLwy5g2q3OmSpSZKL91K4HG
         Z8Vfrq9DXf+C9ypt5h55LSGVXkeC23+j/vzCTXrif3CocdrexLQ9a8Z6TpuTqoIz4Cq+
         BH9oWKUlHd7Ej1x5BBBRzdriK351SERC+VmrqhkhWzXG1QV5aLU+4QPvvS6Gqaa/4zOQ
         wpIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774953609; x=1775558409; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4eFGFBleCM1b66t9OFyEFVeyirGx0X8tI0bngKzp0rs=;
        b=Z4jyZ0CB1usFzjQ1vaiRlfNKU43Md6PIDTaEwjsTtlvhQAZVpbwwkyJu3jTx+3D8G2
         B22/sQ2DuMNvl07I0wPKoOwLMhhrilTcWM9wcrokJ6FwbO/cpAWtnOr6ksJkULpbn/kA
         z6c3I+TX093D6KWO7IePylH174tR0Xb+bGjORaZQObk6GOc2OIl1jDMM3/Pj+fdN3p0L
         85g6PRjSwkc2jQ9hrcPETy6P+tERJoHIvWIjCKI878UvBZ/xJ/O0Bvq8JR6vn+koXluE
         ElPSuA8JJvrzBtCRok0b/44S+Zg2Mig8r2tOu+u4R1rMfNjgAgogLSTi76jiyeF36mPU
         97Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774953609; x=1775558409;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4eFGFBleCM1b66t9OFyEFVeyirGx0X8tI0bngKzp0rs=;
        b=PyTruGQEueBCDy2DvSMVIaGPe/dTkfdVwzxLheQASXV984XX7A7QmyeyGl+NJwOgB2
         Emy/4oPLUKWchkP0+eZ9h+bhOhEmAbCi4kOttwvEQtfle+32Pj7q0WqN4zl4XCwt6151
         1nqdixLNGtvlgMThI+2E0vcFMqzMiziAQO4J14s1lQcHd7eBR94vtUCUNEQmhTIXvc0M
         UFnj4VDxCpF0bzseEpZaoMaK8jVTy5HmsMsux14VeOyO0hc4F299xzImjDSdme+4+oBu
         acyJN4kQMZ4FPNwqoe9M/dy7slqqT4OYEfRBLjrhuwT0ZeCxCqPDsNusfASVDXEylIo6
         YReQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgCfK7g6c8Scc/3PcGn+ZQkEMGFydiYTr9V3rYfr/rRpxdD/hCw0QvnNwmAubUxoB7nDxkwNr0G7pfdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxSSlIVJWy8ulHA8hJ+n8yvBwRPS99F51OgAR6x5G181pggQMe
	uW4iFGighBaTuumIMvOJizlxaI2283UEqKcJ6UEqpSPKgpQ1Y6+FmUOSCghNUXhRg59H3eLlpDj
	uG/kFyosh/FzbsYxzxXF4O2mM1kabqYvVjU924oM=
X-Gm-Gg: ATEYQzxC/MWhqMNgOo14PSnNKrvk1UwUAfNpOzf3XWXRzAweA6ZEtR/VLGtS3mws8Li
	q9Atp1byvt6wv7lD1RAPOSC+6uuDARzbfjOtMEn19HgKDt9skDMRzh03++4fdavgIigPf176BKz
	FRMqvaBtJmEN4wH+ho1qRtdhR6G+i878SvTehB5kVSUpjur04RkeS6+TWQUFH7thenrl5noEMcN
	EI582vQ/kEJVKvZ5tc/kbQubLEns++KDJtSwmp3CSpFPCYA7HGcfrzh4IITO/vJlZFbgqHZhrwv
	o2asnn1zK8sun2Fxeo0vgzPBnmWwS4USVJDwygFV
X-Received: by 2002:a17:902:db08:b0:2b2:56bc:c6bc with SMTP id
 d9443c01a7336-2b256bd03d6mr63304295ad.40.1774953609099; Tue, 31 Mar 2026
 03:40:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330230836.314311-1-bugfood-ml@fatooh.org> <20260331051653.332155-1-bugfood-ml@fatooh.org>
In-Reply-To: <20260331051653.332155-1-bugfood-ml@fatooh.org>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Tue, 31 Mar 2026 12:39:57 +0200
X-Gm-Features: AQROBzCLnTX9Iy9YCVo4j7F97kbJKrMR5h4g-Z-LBkM2MlKJlokUBFFYi73fAkY
Message-ID: <CAB95QASo+qOfFU3tFgowcvyKSyj6Xt+2dE2dDkFV3YrPYWcLbw@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Corey Hickey <bugfood-ml@fatooh.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Corey,

you are correct, temperature readings for disconnected sensors are
negative (-40 or less).

On Tue, 31 Mar 2026 at 07:16, Corey Hickey <bugfood-ml@fatooh.org> wrote:
>
> From: Corey Hickey <bugfood-c@fatooh.org>
>
> +       /*
> +        * The address of T_Sensor can vary; only one of the following T_Sensor
> +        * addresses will be used, depending on motherboard model.
> +        */
I don't think we need this comment in a reverse-engineered driver.

Cheers,
Eugene
