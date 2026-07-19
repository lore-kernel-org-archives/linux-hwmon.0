Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5128C3921E9
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470696; cv=none; b=nJ+ruXtO0SZqwaAEFL+vAzLUWWsW+1ySr/KnWMNpyKcpWcSRSNCmNrxKWUDf68flmLMxKk0vyncwqw2NtUUHYgD6BL5aUtrNxiretIRJgHdVpVPmLryc4qr82P1PHFYme07GTcEsFKWLc8YQBxbh2WeohklR1bW6kR+SnNl1cVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470696; c=relaxed/simple;
	bh=Sne6+JLHMXVKWM/ThSFqD0Omt37JLRvUewfcCsxfB/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsvL9hZDO+HqdsC5+b2WasMWUVrliibPTIQWYlEGrffpx2Exwfgh8KkcOoHLcY2NDiyBzZJv6EB80FegTYsX1CAPLM0j7D288Gzi8WQryOlRfvzANTmud6gNBLDUnz1f7bpDjCHlA6P4gk1KguUQzhybU8BVrbRsvvJSN4LZ0Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VXqU0B6R; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VXqU0B6R"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso2597100a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470682; x=1785075482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wgKBxoWtlXID2rE5qxKbkU4bd4XSZ5xo5Wy1nLV1HIQ=;
        b=VXqU0B6R0i9mVar1FrCSlf2mi7znBmWTTOmh9xsKAPNt2TkxIJ925N1KS4l9wiMYXh
         pf2vXYF5pdTaW2UbWyMWt28Rv4XDrAwNwFeIpFPl2mENy4KDaS1UtEpExAnQZQCpAh0l
         kwMySRP0Z2hYrIU/8FfBPPQRIiYxVYcAEXg7MOi1YQXSEBBjGR1Q6E1PQoTBogdiB44I
         lGQaCEu/zgWCIVTNX5ft1eD1hdq6fthvU4PBTTcu+hk3eGzwPlk72KtwpRWV1CYHu7Ip
         GLFJ4564s/OunCfFHFkD65r6TwxXz/KkqL0nAYoJ5h9xdjsDSt/MCCSAz0GoV21gj515
         hkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470682; x=1785075482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wgKBxoWtlXID2rE5qxKbkU4bd4XSZ5xo5Wy1nLV1HIQ=;
        b=OozyDtj8ci0E8s9FSXCYPTIHXDYi12z24Qc5rXiHFFeQoa3/D4cyVdzo3GQ3HcCuzT
         pCaFDvCqgtWSI3DL5cVF+sa1nmdwc/iIZFwL7TtrR5E5BAoHCObtl74ttA9bVgA6uFGZ
         6DcGVhfmO7ZGhgBNc9e8jsmZPth22Ye6XIpLq+99Q0OT5UhoE5nIt/EhGDnWLAEgqrxH
         husAKOsExbFJKUX6Fr5fMgciDf/iW135mfIBIZy0Wt5tUumeow26gyy339Ez+ajt8Xqw
         NkXN81JcW54rIrRnnjBg/nc9ddR4aeYEkOv5OBsM7CMZHfWqMCUe5jCqhI9tzDxz/ZIb
         dKlw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1qOJDPUOlLSwECcIslFgo42jjy3FhwAhbr8vxJfABU3P/0MdrXW+g+txeIcBai8P/GnIn3aswgKjOow==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWYTncSc8hXHOJmiq2I30ReUaijfYf8Ng8NmXNBGDalLo/CGKz
	NzwnDeu3tfskpCcz1izGHetH3hfjlPYpy+FTz2e41FDUVDPjvIMYqYlY
X-Gm-Gg: AfdE7ckdUPN+0B6I9mrtFKJP9/61111YSdxRtl1AXBJUcQP19dinbCs+uZyTVnDRSu9
	aZXI5ZKkjQK3W4BsM83c+3Wuhnfx+MwNsjnvJI03kNp69IS1V8XqVffEf1T4MlUR9mf9HN6YkWe
	FKFcwhR4x7zhhQyP2HIqEkoffKKgp99dAyGFGGOD/tc3dTr+emq1dKNJ5aXSn8Cgh5rhzMG87D0
	TF05xkk0W31XaVswS4iYD/hfqtFN6bEnCW/N5F5XbbYN6k9PaULzhj4fo/hym8EbdagOTSSmR2d
	8HrLs+WmfeDbQvfBKSsTcwxzYBiRBsM0o+2/Sh9R7pOujOJisajCFoAzvPx/SwLycd3QdTCQX67
	QoASPcWqnvej6v8RamZBLvpBGVY61HTibxxWngxT6CYPNHnrU5uS/6RE2FF87gFCNNgL3tgnXGw
	H5zlIxdjorlLAJnSOfJ4e3Q9o5Iw==
X-Received: by 2002:a17:90b:17cf:b0:38e:5c6:4db9 with SMTP id 98e67ed59e1d1-38e4b4113d6mr10668031a91.11.1784470682519;
        Sun, 19 Jul 2026 07:18:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e3a100753sm6191529a91.13.2026.07.19.07.18.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:18:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:18:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 3/4] hwmon: (sht3x) Add devicetree support
Message-ID: <3fc320d4-2e32-40c5-8067-5e08ead40b76@roeck-us.net>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-4-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713074559.12196-4-zaixiang.xu.dev@gmail.com>

On Mon, Jul 13, 2026 at 03:45:58PM +0800, Zaixiang Xu wrote:
> Add an of_device_id table to support devicetree based instantiation
> of the supported sensors.
> 
> The devicetree binding models all higher accuracy parts with a
> fallback to the base part of their group, so only the two base
> compatibles need to be listed. The match data distinguishes the
> humidity and temperature parts (SHT3x) from the temperature-only
> parts (STS3x), which require different configuration.
> 
> Start enum sht3x_chips at 1: with sht3x equal to 0, the OF match
> data for the SHT devices would be NULL, causing i2c_get_match_data()
> to fall back to i2c_device_id name matching, which fails for
> devicetree names. The devices would then only work because the
> resulting chip id 0 happens to equal sht3x. Non-zero match data
> avoids relying on that coincidence.
> 
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

Applied.

Thanks,
Guenter
