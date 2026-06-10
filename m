Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 579FE3AD528
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 08:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081717; cv=pass; b=fTaGnzE243bQz426RMS8CNI79oCUMH+fEyVCQkhpTIx4DlFs0Be9NnvYjcKjp3zSX2PUvYb9eIqJbRjmzV5FJ8cF/AIL028Fb9VC5sVNGBbhtX7r9cgnyZSoA4FX3CZMXL/FhGQU4VV7etm2PbThNK+K2+q2iQhEzRuMV9NQDdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081717; c=relaxed/simple;
	bh=b+gaqg1zeu8diN/4RO9P1QUcgZfuCJLRsApxbAuPdmU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sg/pPV99fS9qOc7DXjOufHICLfhj/ZGFMx0dIgB9c7Yi4Wk/+vspviKSIZgGKciNasCNviDL5imCxWrNTdk7oEIfmasghezDQRf7/jXHaeLziGLzMZvjztqIRT9VSEgb2WHXr4zc4TPKScpzTmtWBBAIY3UM4pxRcXIjxrogoJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUYhDd95; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUYhDd95"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-138129a622dso4785714c88.0
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Jun 2026 01:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781081715; cv=none;
        d=google.com; s=arc-20240605;
        b=W2+HXCTtO/DjtrQnmNm5WHGRhlPhi9U21JYpFwv8n0daJ2ZiJaz8W7cFrBC1Lw144K
         ApiT74q94yti/Z73jsS3GJdf+YWNXPCK/ADjLRvn0FKDRPYw/ll7A1Tqkj9ahx1zmbm9
         JcXdDT6JndcTFuRV9D3WkV0BJleiF9w+IuBBZxp1KidsBckZ/R0d/JYKTC4klkrYB3nM
         8IfyKfKAjGztw8GeOvpC62NST+yUUkFASP2+TYbKgU6ON6GZZj67KAcWUa5tE7p+uitW
         O+zXQTjeVCSRaJ8nT8qMn7HoStjMCbGy4nm/+9P87CcegQNtGtUFl5yJ4dnvdw1V0Ncr
         /Lpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iNh55YhEuFgkEeB/ThY5qbdXdZbx+uMa748Jhl66MKs=;
        fh=MhyoxL8czfz8mKuLVaoTmkTW7cEAx3v8oKLAN+Tk0mc=;
        b=B26LbsGwOrdjbcGWNaKcD5T6c4hzXN9jXRr93o9L7+5zA3X3FajfICW6X7qt3F00Zs
         d/oJTp8yVShtapwYtJ9EvcGtWZcHwJ6Q1QEgVMBWgPtgO102qbFcHm2F19nv2c1wl4yr
         pKo9a5MJcfoUo0bhMtXnRy7q+LY9HYBhK7IHOLrB+L4SV1X9MvpQzWg4jeIrN1oEEKC+
         m033ym5dwcm1vGrQB5/MXQPA314apHzHPGvyhqpwyhkd/b9a68XmYQJr3on9JX2YSG6i
         vip9FrPqzXLZDoM+1LjrHXdmdI+yfEUvVMQxU8/OKaCtZCqlo5rezpf3NywjTU7VBqtF
         ckXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781081715; x=1781686515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iNh55YhEuFgkEeB/ThY5qbdXdZbx+uMa748Jhl66MKs=;
        b=WUYhDd95KV8fd80A5mxLoI5c82QmWIR4guBTmUFgsZ1PLnHhlX84xqwWSZ9cMZ9ioU
         jX+rzdzcyHzaltyLOK6sL+cytSFNNmBmTBHGaWF/WXUbeXlOB9gke8Xx48v4c68+STRc
         cOAZo6fcj5MFPBihFxdii4hzls820ECXvL9m1neTijrAYV3BjoZNIztIlfmB7AZFmFML
         mP+CUvlfvPkH2GLtB1ECj6AFQps2S3aZ04oaTgi+veGt8YnO8yErez7gGOzr9PpTnelo
         IvhvBanPCepttJInxZheBy3ctXOs5SgNoqT/IQ0Zgct7pExmSYzyG4n+1fJfWoOJkoNg
         OLBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081715; x=1781686515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iNh55YhEuFgkEeB/ThY5qbdXdZbx+uMa748Jhl66MKs=;
        b=eqNGRSu5aYFU7IMHm5VMlHkCkVXQAWYNqwKP3n2Rvp5IXesVzkDMX5hm77cSET9drz
         DAa7gJH2RTwkETpzcRcP/a6OcejWD7sRocRGQR25Egm0/AFoAiQPicsRuGCCJlb/hWsU
         TvwklyE7CYbRA80edFC5neRSDBIWoG7qmAtot7tErRqEGTE2CVA+8tJMNmy610db3iMr
         OqbkSkDSnNg4n1G+Q8lf7znRvS//QouuBLjwRdL+t9zsKYhKcqlxjOubyha9e3lqWhSz
         uz8rrGNWRoCoomfGMEqo6zcBlBRPRyeWT7uLOzsUUgnYY4VOBZXQJzt0fW/ogeYi3nUX
         +nZg==
X-Forwarded-Encrypted: i=1; AFNElJ8IlekTf5SI64wiICpQ1lMVrD9VkWuobjbUJKthgRnwromB09W0gLFFV0Ogvwt0Ksc48rgNE1cJWx/noA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaxCuOOVIEX2EY2THOYZzAErhl/7rfshLAbo3KggspOwXQ2jdt
	rQSJoAQMFX9YbKmWq+qOQOdwFqIakRaZQklZxK30cPxAcrRsJz2dt/rv6Bfs7TrJz5DFj51BUrn
	oM4oRrcK+xw4oNy1FXFAHy+zx7xA7O2RT+dBW
X-Gm-Gg: Acq92OGs30xRNM4jjYMhomXuXpZVsJNhr4HgJ1V4p4h5eWCNVJX/PWQwSKez8tnpav5
	0UHRrcfIVFImIb/3/O42vLmg4IJ/C/+4Fh5DvmOV+bN9QQ+1BHQt6WrtDEdJvHusspSO1CLG/a1
	cl3K0v8iySsRSPL5EBkJ4Fh3bw+0vYWd/Ai/5Ju0L/GspPnKCGouMLVPDu7TRc8PGvGZgE+AgH1
	2HQkJ76Ox5aWc5xs0LIcGo3/+af85QVbP9pjaihdEeqapjjrrkC4iEvspUfdkhlgcw4iUNx3g6D
	D6LbrrQGplUuqcQg01M=
X-Received: by 2002:a05:7022:672a:b0:136:9ebf:3c04 with SMTP id
 a92af1059eb24-13831ba95ddmr4043869c88.25.1781081715309; Wed, 10 Jun 2026
 01:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260205102942.28745-1-tinsaetadesse2015@gmail.com>
 <20260205102942.28745-2-tinsaetadesse2015@gmail.com> <aiaw_mwxbuCqzCtY@zenone.zhora.eu>
In-Reply-To: <aiaw_mwxbuCqzCtY@zenone.zhora.eu>
From: TINSAE TADESSE <tinsaetadesse2015@gmail.com>
Date: Wed, 10 Jun 2026 11:54:38 +0300
X-Gm-Features: AVVi8CdVO_8xMFsBP4UBhrNCPNcIoEaDNmEQyaVjnbHkcXIuGp-tVckvXwNk_4U
Message-ID: <CAJ12PfPTzHbhaXH3sAnMoE9X8a4rHrpzv2jfdnqqJWXvx+OnGA@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: i801: Detect SPD Write Disable and expose as
 adapter quirk
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 3:28=E2=80=AFPM Andi Shyti <andi.shyti@kernel.org> w=
rote:
>
> Hi Tinsae,
>
> sorry for the very late reply.
>
> > +/* SPD writes are blocked by host controller */
> > +#define I2C_AQ_SPD_WRITE_DISABLED    BIT(8)
> > +
>
> We don't need this extra flag, we already do this statement in
> i2c_register_spd().
>
> Can't we just assume that for spd5118 spd write is always
> disabled? That's what happens in i2c_register_spd.
>
> Check:
>
> 84d477354b0a ("i2c: smbus: Support DDR5 and LPDDR5 SPD EEPROMs")
> 4d6d35d3417d ("i2c: smbus: introduce Write Disable-aware SPD instantiatin=
g functions")
>
> Thanks,
> Andi


Hi Andi,

Thanks for reviewing this patch series.

> We don't need this extra flag, we already do this statement in
> i2c_register_spd().

Based on my testing, the issue does not appear to be in the SPD
registration path
handled by 'i2c_register_spd()'.

I verified that:

* The i801 driver correctly detects SPD Write Disable.
* Disabling 'CONFIG_SENSORS_SPD5118_DETECT' completely eliminates the probl=
em.
* The suspend/resume failures only occur when 'CONFIG_SENSORS_SPD5118_DETEC=
T=3Dy'.

Based on these observations, it appears that the SPD5118 detect path
may instantiate
the device independently of the SPD registration logic and therefore
may bypass the
SPD Write Disable handling added by commit 4d6d35d3417d ("i2c: smbus:
introduce Write
Disable-aware SPD instantiating functions").

This would explain why SPD5118 is still instantiated on systems where SPD W=
rite
Disable is active, even though the SPD registration helpers are
already SPD WD aware.

The above observations are what motivated this patch series. Am I correct i=
n
suspecting that the SPD5118 detect path is separate from the SPD
registration path, or
is there another instantiation path that I should investigate?

Best,
Tinsae Tadesse
