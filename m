Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1DE2C21CC
	for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 22:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768687907; cv=none; b=eA5UNY8s/KkXVhaIGntgeOHQheZLcAOJgUuyYjtET5f9WWQLAe0NzgCrc8PWB8Nf1apys035vH9eb0rYo0o7+MFVSubSSTOqLOrKURB/9YnxgHqEPtzPiVcH1uwrBF9JAkWmjJ7pad0BfmPWMmpUMcgtKpkpV5qdopT+kawnNXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768687907; c=relaxed/simple;
	bh=0QsN4/s8foqpiEU2z8LgKHsRmHRPQeEOz4+b7HvRAaY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7V79MsqEboDkz4lhM7Kp789UaiTupAGGU5IjaY+43ZXnxOFF9IhTKAO9RlUQpBfKBTb2TBM7R+NwJFLocf1RC2Ooqgs7HQTsXKq6CYeHX07t9Lz8qjJblMkBTuXdU2KygjocOZCZJqdtmWbgGn4X5/6EiHrvhh2tFcPYXoeFaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=NTL7pgPa; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="NTL7pgPa"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59b834e3d64so4476671e87.2
        for <linux-hwmon@vger.kernel.org>; Sat, 17 Jan 2026 14:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1768687904; x=1769292704; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0QsN4/s8foqpiEU2z8LgKHsRmHRPQeEOz4+b7HvRAaY=;
        b=NTL7pgPaCCeN29UEZ6r1c6GhXVoIuYYQHe3dWRWm7tFDWZG6IglFc4lUtvxFn2GEeh
         tquXv307qJQi5yzn31gMMAVrcfFZfrUhxy9jt25+VhBY9TRZsW7aH2EuBrCnjl4PDO6K
         TR3ES0InBdgmJCUpK5Hj0HEO8CMrPuO6dxNdq2/ykzsMZ/37YJ4mQnNXSnatgGE8spIy
         4R9QDxOqA9fyYrXF8hAIItcpcmxfmnl6YGIOtKrZaUzyus2BumddRCyJFM2MlSGlUTbO
         PS62KPMf6DwoGoxF7CpnZoEmWvOaY3dtwkIMSIIXJV8VJVMlmjFDQ2BdLFD7iNTiaF6w
         LQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768687904; x=1769292704;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0QsN4/s8foqpiEU2z8LgKHsRmHRPQeEOz4+b7HvRAaY=;
        b=BWIp1dVNIEVjzExkTtgvRgkD5bame66gSPHTv6ndS8iiLlouDzypkx3hsQq15z3xaH
         6ot1lcmGPgavaPMHA4MSxGtjat9WLHBfbq5D50jLHRcFoE9RhGGIFgj7Sk6EWIvcaDE0
         LbUu7Zw8jtUc5q9suk4L7MH/4X6vk+VQ+RmQQ5jv6ZHUS2+vqC7ZdkbVioo8+yCD3JY6
         RU1iLCvLM4B7ya5Ml56qhFs+K4EcsFTvoMdVsT+nQ9de6zp2q08/stiTSexJvV1se+xR
         R2uVnJ+kuBE3AVbUxW9pCercwVvd0gMSM5meWy/+4rkx6TOrjtu8pvIguYW24kmjamaE
         hUVg==
X-Forwarded-Encrypted: i=1; AJvYcCXLJk6bNGH3VZSB1rUze7eEhm8jXCmA0hy1bCDSfUGdJX1X9K0LP2ThrJ2K8mdVIBw/iLOy4rUbFMHFlw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzXEfwqmnJkYe2AeKWg2AZGbXxb6I7FoN8JTisTNeCA+hnUJQW3
	TU97s177sYZAAaiHVIaR4zhA63JTBH4p+SfFv8FqP4yGknIaYIK096mEAJR/LSJDoJFCnz84ZkS
	4ZVk5AZczjLANgM9ciGu6BEIQuRHrYFs37gY/e2yX
X-Gm-Gg: AY/fxX65HEZAOtC/OWfliFjNlri+dDxacsGG8cxFVJmaZgHqJD8NsMSLF3w/OhTUdJn
	8rKtH8CV5jCPQmI4/mQAVR4RCCPp15h5xwL3hm8k59h0eYCmx3Trz37qf682k0wjnFqPnFuRrdk
	CQ6SbQtIRgGcVmvMs3yoO4vsSWGk33uWK7/XfVrDnwud+/gyFIX1DCO1GWmLKQSQ0DBNpVXgBfT
	j91CRfNmoCBUKv1FhasqrBWyWdzuV5pTX5a5FKT5NgcQnfPVfkqbC/stg1Vo5we5sXkNyQwjQ8H
	Qv582zFBHSCTLs1fOa883GwzXnA=
X-Received: by 2002:a05:6512:128a:b0:595:7854:af77 with SMTP id
 2adb3069b0e04-59bafebe300mr1967672e87.22.1768687903932; Sat, 17 Jan 2026
 14:11:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114221210.98071-1-yahoo@perenite.com> <20260114221210.98071-2-yahoo@perenite.com>
 <0a4bfdac-3f3f-4dd7-87ca-a4edb58d2bdb@roeck-us.net>
In-Reply-To: <0a4bfdac-3f3f-4dd7-87ca-a4edb58d2bdb@roeck-us.net>
From: Benoit Masson <yahoo@perenite.com>
Date: Sat, 17 Jan 2026 23:11:32 +0100
X-Gm-Features: AZwV_Qjx8bKNnZwzQX3_lU5KGOFlQslHdigKheBNDxdgxIwKAmWPkmTQh2fb6AE
Message-ID: <CAGHj7OJ75Sxn9AVguC8uFJwd8rdAvSREKFreWW3_-E+4MaHycQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] hwmon: it87: describe per-chip temperature resources
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 17, 2026 at 3:39=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
> Series applied.
Guenter, my appologies but after changing some BIOS parameters of the
IT8613E it seems the patch has something wrong and creates a null
pointer exception. Can you please remove patch for now until I test
all BIOS/changes before re-submiting. I'm sorry for the miss here and
your work pushing for this but prefer to prevent the patch for getting
deeping in the submission chain.

> Thanks,
> Guenter
Tahnks and sorry again for missing this.
