Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BED38A717
	for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 16:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792341088; cv=none; b=aWrIXf8VN5k3Dl3ORWgiAK1QtHjDYmE1G659G3CbNxK95IQVorcD2v6MyMcH1x14J12a1jPWnCHSqWf7AR2kJxbwIXtt9sy5Bf8FLOZWENWuA2rPz88G6CtIrsX0mrMLReQci/0hhj/kQv/02bhAqIlX6LYI0Jo9YqVdakEMx68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792341088; c=relaxed/simple;
	bh=au8Gvd6+WEU8zV/daAfKj+L+yF0iVWqrpQqPfGml9hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQVMEEPjm39Npysy6UE7V1624qBgi26bup6J6yOV4xAtpqVyc0NkrEaky43NJsQxV1xVuIihxZ9WRwiLPyZxVJ/vQDAWat/PsfLyzBeFNJBaCE/nU8Vd9+FUMzev3AGlVlqM2sl3SBocY12bQA2omf1/LKjyS5mzUfTbKCfDIO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K68T5dXo; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K68T5dXo"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc147d86bebso818224a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 18 Oct 2026 09:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792341087; x=1792945887; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WhZ6HkRzC6hmWIpP7WOwdVZqWzvDpVWCEpyfcLFKaWA=;
        b=K68T5dXoYJ4LB0dffdYrHGl8E09ixEURtKBRxGfRCzYSoQHua7ORO28K/S7uhmvK+R
         zNBDpAe2SaEqzJLKwXS1qlnBmKARmCMW5Epw3uBTrErM31vIYbnArkeqyuV4ntlBzenA
         mog7uzYm1Ua39+NUkd6QDzxNowI3ZC0r64gNMqKA1cCuqFb/k/BUlxvuauCULT/7h4mM
         DKs/bs5jpJ/A6rsrr6x6mTcvjmFU/LvddoxIH7aZkY5DYRsNqtDtfO0JlsSz1kFkNGIn
         P5bFPR9ZGWHdUAuR+jpw6OjE4987B9USltJeCtJlmWMQCz3pybLkKBrCfqzdUE93wkvC
         2Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792341087; x=1792945887;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WhZ6HkRzC6hmWIpP7WOwdVZqWzvDpVWCEpyfcLFKaWA=;
        b=VNwt8nvTqE+X0CqJ4M5G2zEmO2lqe4o5PBPWD3FpZ7Oo70JoEVK/FGA7LujIv7Chru
         DhdVV0OXTtcidCZnMeQQupahn+tjpJw8m0JKu599IhIokLtwAiN4qX+t9KWFgmsXa7RF
         kEFCovZGrWgPYBLEW+qKDhPsuefbMQf3iMz6pNsa44LndEAeRNMSCbRHGlScl78k3XXd
         CRYPO/7/DOFP6JG00JbzFIyH5NmDq2V3sDJJyn8JvMhWL5AiatHb+r4PN7GiLBCBHIdx
         ao4TOD0ThCRSvyYlV+3dPW8MBRDLmlDMPB9qqFJhDkfq4HgEgsWAr71Nogjj2K6Kku/d
         WU1g==
X-Forwarded-Encrypted: i=1; AKwUvBx5eQdDQZMai62tEva6hP6+42CzoLR/XAGE0S7ylqfXDXdpQbP2JTdWFJH91c4qlFbLQvH9YcDvcccEUQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIlCq2d4Pdk+8SP434zE04rzl2wtworpIGt+3NEp1S+5FuECdz/
	2y3ofzIER8fqQFxi2XYPYXOEDaMEnWhsuohQuD5N0XY8RSHa+TDqH10D
X-Gm-Gg: AYBFou1oATfK+2vLxud41RvE1U/g2wxsEn3xJ9n+jjCLHdBZYHFYJrAUghHvpMl3cVS
	PIIzv7Gdq90N4STHKgqcKjpxsWcmDwsiAtOzavLNFgLuZleZjBiAy4BMF9Xw7D9uGZeSos0o+6s
	152ob/ZDx13hUS8l8q1AGNe3drszgjOUVvq+iqEhVKtZMnbBT+SPGt2Y3mjiefU682spzRdtbiq
	WrlHG5vmfIbamh6LkZpmUf6Ajoo/+tc4DBnKa7wqAjIkeqLFDq4uQ5MrfiX+hyJSTNcMyAFqWJi
	2nez5VibcFRY0IkRWilfG7F0sWP4vMrCSdnKlxLj6q7dSMoBkwtmDxA1lXv3gdBsu9s6CaHsKnq
	udDqwy6wqquM+W/ALgr7S//JtCLY0E1g7tSFMA9G+eneRnLwMmvOvf+Lzt8jHWYUPs5CfG3uz5h
	mywvdGkvYKl/v+60wHk6h2ryXfMMGGHJpFB+4vPymZ3LMHR8tEeh/xiVXxgnG6aMiNigy97j+Za
	XAdG+OzrD5Iys/jvjQXYec=
X-Received: by 2002:a05:6a20:43ac:b0:3de:7f6c:b871 with SMTP id adf61e73a8af0-3e22607ded2mr3605547637.36.1792341086646;
        Sun, 18 Oct 2026 09:31:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89fd2737d20sm2611477b3a.35.2026.10.18.09.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:31:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 18 Oct 2026 09:31:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Qian Xiao <heyheyco@gmail.com>
Cc: Ed Brindley <kernel@maidavale.org>, Denis Pauk <pauk.denis@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (asus_wmi_sensors) Reword BIOS upgrade advice
Message-ID: <08bd0bd3-a80f-41bd-a057-208da8e823cd@roeck-us.net>
References: <20261016163509.249020-1-heyheyco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016163509.249020-1-heyheyco@gmail.com>

On Fri, Oct 16, 2026 at 09:35:08AM -0700, Qian Xiao wrote:
> The Known Issues section suggests that upgrading to a BIOS with WMI
> method version two or greater should rectify the problem. However, the
> driver refuses to bind when the BIOS reports a version below two, so
> every system using the driver already meets that condition and the
> advice does not help.
> 
> Instead, suggest that upgrading to a more recent BIOS version might
> help. While at it, fix a typo in the preceding sentence.
> 
> Link: https://lore.kernel.org/linux-hwmon/CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3nhqj9mose60t+Rrry1aPvw@mail.gmail.com/
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Qian Xiao <heyheyco@gmail.com>

Applied.

Thanks,
Guenter
