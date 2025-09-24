Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627741C6FE1
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 19:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758742292; cv=none; b=ixF/vwaf8ya67VWfmqCADkUB/DhU8SVO/+GHCGhog7qLd8sO764rDV1k72IWNiLtwO3LqRbQ26JNTQTurec1LcH4RUeemZwrdsghvvmU+En6fPFovZZ9uJJTMnNh3egRZrCNDWJMYVGmnI7FF6dzpQpdq4nq/fZSfAc3s+tNPeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758742292; c=relaxed/simple;
	bh=USTPbmjc7larzUfmJLTr1dEREs8PNqu/Af6hD/JnsLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JN6PAD+kb2ebjdvcFNIdq+K7FUItrSVNO26CU4/3Se9uhMZ1PsBqYNjmEBKNdRfgn3psqLF1cGcey0HxbxpICsORIhHl2Ztb382kTnrxzG0Xdv+E+9Z4G06IsTZ6tKRetfG8ody7zbK7GWy3DSERpyErnKpi1zxfmU9PmspjvTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A2PxfX+n; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A2PxfX+n"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3322e63602eso244785a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 12:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758742291; x=1759347091; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YA3h5oB7JadoxHehwa5NeGVTyzJoF+sGhLuexgW7Bm4=;
        b=A2PxfX+nk0WkmX1JYbDnYTaWpZAm0+isLhmyD2bi9ChvnRuAfG06O7uI9ewKwmJbup
         CGwlOuKFnX2dMYU/TAj67X1tLzIZ6GXwDVEXwzBO2lYRV6hWtCnz1piOKoUzRSGgmZ9T
         m45TQE4R9OtXvy2X04po5uwRnaNKFLiIutFI6Z/cIpz8Te5AQL5q0jsgtKxCQuAlaEgd
         v5lqkGeFFZmhX+gOEM+cjTfgXq61BwFg/+vXTOqn5NIWF1k+k766b7A+0/RmirV9PJbC
         m4ClbXjvjtV77RJbYkisp0Pxyu2YDktj1ahgzcRIm1hXroUg7FP9s071xJgtAVtss/lB
         x1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758742291; x=1759347091;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YA3h5oB7JadoxHehwa5NeGVTyzJoF+sGhLuexgW7Bm4=;
        b=T8kDAjVNU5ncIBNsQZqTtTWBkRDvgFY/3lJwf7BB3NCSkiVTLwQrirq3tgU9zI4B+R
         Pdw9cAjyjwMMwwCPXylWK+cynQBSMloq9bWnBHzF930/FRUlxJ7jF/Nk7goSOHCeAtRq
         gU4CmnNC94Swrt7vdoTg5zN3ahRp9MfxorWeNGgf7W3JxZ9qxRHNcny/ZMuNenhuw+4z
         0fPL/fbYu1qLcUs8J4nHaER5e6YAAX7qUy5yy4YQ2EBL64qC+RrYBINnkooYhwWdQJxr
         71BLmI5qBL9OKwvKfhY4vR67aW2kUAFWb7pijEykaymikwVFciKe6k0M7ADRvrhd4sC6
         GhdA==
X-Forwarded-Encrypted: i=1; AJvYcCXoGoHwMXZUxpCPJ0c7fWVGGkmHR2bc3byk0j+L/Oxt4q+PKkfo2eGsIfGhD4jqxfhhQZ1QGl0rz+nDTA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw550erro1h1fJtwlYSKX/tcHlzNPYJyME3HFkj3GlYWL+VzRz/
	9LkQqXKV8Qwjj8El/8V8KVIS35CvjK/LfpUvi+i8YEIPC2Gu/lX99GM+
X-Gm-Gg: ASbGnctYaVkKPTJIr0cO55fRnmJv8e0qo/Apo8FpRyxEnqCTWxavBdSHpZQmia/XJkH
	k+fX5pnG5bNfkEY+M3LilgYfiUcngYQJvLS8g5+UPmtP8VTzS9+Qi11atbbjyObMcIU94tUfsCJ
	5OAgUFSz7paPSN9pj0Pq1mjSO0pD6ztdS/pKI4yY37BpPJuyaGfR1eKm5te0OL9lxeIU+/fxfwp
	IYq+m9Y8vRhxseTYmDEo3wiWxB2R0OPMSn25IZn5XaPFEbH2rAj4yHA+V14xRJ2yFnbe6+FBrss
	vD94mUFg6koD87yG5Co0qjyTZQAdHaSVpYHO7vzQRBnJRuNb6FfpSY3GCX+9jK9JOKH2rmHNycA
	DTrEs6a66pjj/o2kCXEkTrKWk7A3WIPC4EZU=
X-Google-Smtp-Source: AGHT+IGf79Ctst2lzMknAqjXUhWGTlNDl/Rp/nJBOnuaOSO/Vxp7PZh8N9WTKkOOb7wF5fRUDXamvA==
X-Received: by 2002:a17:90b:4acc:b0:32e:38b0:15f4 with SMTP id 98e67ed59e1d1-3342a22bf2emr746435a91.7.1758742290588;
        Wed, 24 Sep 2025 12:31:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3341bdd63c1sm3208982a91.26.2025.09.24.12.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 12:31:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 12:31:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Sung-Chi Li <lschyi@google.com>
Cc: Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
	Jonathan Corbet <corbet@lwn.net>, chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, Sung-Chi Li <lschyi@chromium.org>
Subject: Re: [PATCH v6 3/3] hwmon: (cros_ec) register fans into thermal
 framework cooling devices
Message-ID: <c2dc1970-386f-4e4f-b1cd-ca849d002aa6@roeck-us.net>
References: <20250911-cros_ec_fan-v6-0-a1446cc098af@google.com>
 <20250911-cros_ec_fan-v6-3-a1446cc098af@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250911-cros_ec_fan-v6-3-a1446cc098af@google.com>

On Thu, Sep 11, 2025 at 06:56:36AM +0000, Sung-Chi Li wrote:
> From: Sung-Chi Li <lschyi@chromium.org>
> 
> Register fans connected under EC as thermal cooling devices as well, so
> these fans can then work with the thermal framework.
> 
> During the driver probing phase, we will also try to register each fan
> as a thermal cooling device based on previous probe result (whether the
> there are fans connected on that channel, and whether EC supports fan
> control). The basic get max state, get current state, and set current
> state methods are then implemented as well.
> 
> Signed-off-by: Sung-Chi Li <lschyi@chromium.org>
> Acked-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Guenter
