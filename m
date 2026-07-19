Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5BF38C438
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471676; cv=none; b=bGc2fo4IkjG9MjKDOED1lxrKtTq6WcBLjgJl/2HsDJXWnS5NMTdB1yCshS/IOkDvrGOxECLW485C2Rnet/b+PLigVB6OaDdA9cv5yilLXMIQOxvqI724cPjya4sxKQtS8HkWUJGcNvTmSOMBSXI4IZoDci6dE3AYpq18zIuQMEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471676; c=relaxed/simple;
	bh=MYRme9/0hd5gQ+iZkUXgEwdZo0+Tc2QA6+dqgqARUtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IjZ0ZkM61dWxA8nbN35voUDtXQP1F+/cB8FgjEJZ2Q8GlkFLBuRnCytwueTRxsn/KHNwCEHNTXlzKkobyPGlpQoqbgMQCQhqJ4APg+zugA8WtzxG2uno7RcjNtbZLgdHcia9+9MThohHAsWWS95wjoENIeMwwqxRpXIHVuGk05I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8XG9jth; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8XG9jth"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso5872795b3a.2
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471675; x=1785076475; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZuYYfoOm8o/21SPRFYJR1NlB3VZ7CmSNo2hjOFoKrYo=;
        b=U8XG9jthRALR3YKVQ+Bu5Hx6Ta1Hn7r7uv03asvHLh6z9ZU874yk58QppKDbLhbYik
         DrFVvOAvvTNXwenEERd0ozZMNTzWm56OS5rv1aWlyztXwoE8nOdL3XSFlHXI1C6u5Hji
         o41sN8gRcs85ZZk7EN7A7abhjBV3X1H3rdz54wSdgN9jK7b64XJQ3k0PDITGwtd4H+zD
         HGmP6tW19ff+HfrahlTMe6EFyDudu1RaXdG8MaMJMyk9kSGg+tXnioFcwzcPahPD+ACJ
         neVBFHB1MUmnu9ST7v4xmGXLh2T2uzsQBMRFYJ0Ihbag3X0gXE3+ftkpd+NL/CgML3yC
         6rhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471675; x=1785076475;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZuYYfoOm8o/21SPRFYJR1NlB3VZ7CmSNo2hjOFoKrYo=;
        b=CQ9ELDlHd4u1OXkYEgJuJh5phOt+nxMZrQWA+nX/MYWhqeaLdnQCvVJON+RvDPWmsL
         H2IEUfGq2+9N3NMdbyUVgLHRIezfIi+bsKQ9XCvWgXR04Ut3ciSQAl8wQjE58CdNF6C6
         wtQiAmzTIT3cXR03FhLMxUPNNkDvLmKbXk+SK0I2qqA8Lsj8JPNWhJuw1Fj0YqZIF7g1
         GFCcBcmy1A1mbBgbROaJe6ACvA+QBG+lhBHLIJRoEZo7wTQOHj/cnHFyCwC2tMOIKA5S
         eyRlVx6kULtg7STqpRvBFnq0JfW/fhDVP73ug63izU5gHqOV9Go695fSduf4HAtqwCVL
         v2Iw==
X-Forwarded-Encrypted: i=1; AHgh+Rqsxfi2e71ql3jV/QZ8ndaKBSuIRTguNhKlKTXMgWzXxAmO/npKGmh+IfvmiA8tl5AjZQC90o/LW92W4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7N6xGafixdy7BF2ZQ53FlovMa1d2+ZOOTtTG/7dmPOEkk7rce
	G16M2T3ke2nxok3M6LJcxPXI70NgrCIp7BDJQFIUpBJnJd3ccSfYtp1k
X-Gm-Gg: AfdE7clFSpadnH6FhPnNADX5rJcb1KaicHSYRKtqeMXkezuo64flWMH8Wph2iSzF5uH
	yiMprWuKd8YrPP1El13e1uP8x1PmhWuQMxL3E2M8iQSgBBsXYFrluYg2gbn3ZlBd1u3fZ5cnZ2v
	3petGfsxlhgx7eGFiBtlxnaXunWHe/Cp9eVASxC6WdMIHsFmHoVM7GZVNAKP9oziblvoYTuLaBo
	kb7rBUx9mK/V0luEfPn1uOPCuSP9r0OUBtI/Gp7r80o4rKjSlgPlI7FKmiW2xqvI8RV65rYwl1k
	9nHi43dwODba0JFIxxVlI2vfBsNf/n5fG7p6c6FlAdeZiEakT4adhmFKgaCbgffp1r+MhiOTJNX
	vGwTtH3LPE0bQtAR6wlpRNZP4tzI8jmslUiriA+5EBM/HIOVsyBRRfFUUNRBpEy7EyhDfIntYeN
	1G3zWR+uD+3mLDTayBfW9UHNR248t/T7OwV2zk
X-Received: by 2002:a05:6a00:4212:b0:848:401c:98e with SMTP id d2e1a72fcca58-84c292399ecmr10382758b3a.15.1784471675040;
        Sun, 19 Jul 2026 07:34:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cb519aeb334sm3399325a12.18.2026.07.19.07.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:34:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:34:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Benson Leung <bleung@chromium.org>, Sung-Chi Li <lschyi@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (cros_ec) Register the thermal devices after
 the hwmon ones
Message-ID: <359239e7-5986-46ea-a782-ab2356d581fb@roeck-us.net>
References: <20260711-cros_ec-hwmon-locking-v1-0-cb6d0fdbb2d3@weissschuh.net>
 <20260711-cros_ec-hwmon-locking-v1-1-cb6d0fdbb2d3@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260711-cros_ec-hwmon-locking-v1-1-cb6d0fdbb2d3@weissschuh.net>

On Sat, Jul 11, 2026 at 11:59:05AM +0200, Thomas Weiﬂschuh wrote:
> To guarantee consistency for the read-modify-write access in
> cros_ec_hwmon_cooling_set_cur_state(), locking is necessary.
> The locking will use standard hwmon device locks, which requires
> the hwmon device to be ready before the fan devices are set up.
> 
> Reorder the initialization so this works.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
