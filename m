Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E7D2EF664
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 18:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760292658; cv=none; b=bZWn7VP6uZosTeT7dM6jlx4uxPhuuxIbqueYZlYDiWcPTkKvLPu7bvhxpWF6f10+GtvEJqEBAZX9shpNizFpfmKpall1ki3U7sCK4Ffgfh/Tksn7z6GBp2QHvvdXloq3ZA+LwixvnVOqvtxVtzVyRWECQDA9oGPvwIESHCPH2VY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760292658; c=relaxed/simple;
	bh=NJhSNDeWNvONDKstagZ32g7L72fXk7hiPZla9HLXGTI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpYxfuTWgXF9331An8/b1nvdrJAdFIxG6g4hIIJevmr96L5SOjQRnRt6gaIJpVgN0EB3PSZVYiYT/68U2jjJoOvSZsvNqjYqHrhqKIqp9eCw06PPR98eioC/+T+36bW95B+rIsKPmsqewjA1PaQUYPQuhHNfA3Gxf/hny2PQBDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jzfy2az+; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jzfy2az+"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so4624999a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 11:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760292656; x=1760897456; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NJhSNDeWNvONDKstagZ32g7L72fXk7hiPZla9HLXGTI=;
        b=jzfy2az+GuW/ZRQThfGlruSOndEKBSeW2Ubk8/8e8TwdfMXswx+LT/xtSchbGJJPht
         8HdjgVH4gscXiC9wPSP8edYUGLmeDgPE8PhaVmiItK+6vHxV7Ov4vVJzgiX2ejN6Rw5Y
         VlDcnelsPMOwJWtEy29HkR6KwGBYY/X7hKUHuKIB2tAy3nk6SkCchD1O7IEzKfMn+p/T
         Z+1SUWnbkmPHOuKle2XpAdDM266WSAp7VRcT2V9uaCnS+pdw+gM5Zxz+Bzt4N806fym+
         P4EzDO3EaEcngEaCmdf7EGdjpNrcsn/u8y+oAf5WRLmHdoGVKlnT88I2i0BsWrlMoXfS
         oDNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760292656; x=1760897456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NJhSNDeWNvONDKstagZ32g7L72fXk7hiPZla9HLXGTI=;
        b=EIBiUwAHV7yO4lZerSNQGGgxg9u1nh9bSFeFaZjAYcimKz+KIqdDssZJsv9341LU61
         IN7OtrBbA1hs0ynIvPMOpM+OScaxlds3YYt5wDqVma+aiuCSPvvbXD49Up/8oQIQR/X1
         Apz3NSTq24q5cUWbhHJmwCuwFlYymDiw9W/m4/kvo1o7ArKQNvxnlNvMLM5wlzlDvKTc
         4ug+aiLdUzEF3SremGff3KYtx0iPb349OgKYb5haHJRXIF6Lx8qPmTvKCbl1m0KgKZ2y
         DDap3waN5k+Mohcj/WwZIP96jYHQ1wqO3ximhosEUXw3twFoMgpojC1ODQz6F/umJtK3
         6Clw==
X-Forwarded-Encrypted: i=1; AJvYcCULiZYo78jXiQBcedlv4BSbF8dEUvJvY0FzPnZBYa545EC6Lrnd1SjBFJtppmkDHrXGJvmHDrcXgTJDDg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7SxFbhBzGRez4MNLwPF7UB+nS9Ud6PqjhQCTFrPw/D4gmuVIh
	Shvfh3MU5eRiGav3zhlP5SyXUASPrmznLNxqLc19WyNgVLi5cA52FXRP
X-Gm-Gg: ASbGncvg49O1HYyM+vZetWK48/NCk8SG96K6js8Yk3Po5BzDXFythguywLIMZn3FPad
	25hMya8LfW86nyvfWvP0LAgwtwt5/NvZTFlhXybawK7Bfvs3LjyaD7kFz8GYTL2B0mugGiGNP2k
	rtQDgdKaFsffZUqAVo/4bTz9RJ5x5M1Zo5TLoavs4BMnLv5VC4Gmdl1EREWfv3SLzNXE0K0bS4r
	Muq2v8I0pDEpYibA2N+3OGMe1kKrln7btrH9i1dkxkiwRuddHESbrKkjoijBoSzLTxJtJ1JI9Lm
	VR/GJv48RZ7ehITBzRreiQ5eWvYeFNC2IlzqJFkhU7qVsKVgLshFZZa5vowAAIZ8XnU8URTyf9q
	E/gDcTrtJXN0ALQqUPnWQFe4lpVwhChr42LPnmKw3teg3o7hFoC1XPCoc3iBJSLDg
X-Google-Smtp-Source: AGHT+IG9/G7m5BIzR4diatr/nXRqe5D/3HvVmLeZh5LI0vpljb9ZCvWzlgmVMhvlJVDTxVmvWVWgFA==
X-Received: by 2002:a17:90b:3b86:b0:329:ed5b:ecd5 with SMTP id 98e67ed59e1d1-33b5127bf42mr25738231a91.19.1760292655903;
        Sun, 12 Oct 2025 11:10:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61b12756sm9564411a91.25.2025.10.12.11.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 11:10:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 11:10:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gabriel Whigham <gabewhigham@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: hwmon: fix =?utf-8?Q?typ?=
 =?utf-8?Q?o_in_sg2042-mcu=2Erst_Fix_a_spelling_mistake=3A_=22supprts=22_?=
 =?utf-8?B?4oaS?= "supports".
Message-ID: <a88dcdc7-f6a0-45f9-b39e-deb5b7182b9a@roeck-us.net>
References: <20251006001808.16962-1-gabewhigham@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251006001808.16962-1-gabewhigham@gmail.com>

On Sun, Oct 05, 2025 at 07:18:08PM -0500, Gabriel Whigham wrote:
> Signed-off-by: Gabriel Whigham <gabewhigham@gmail.com>

checkpatch:

WARNING: Missing commit description - Add an appropriate one

Guenter
