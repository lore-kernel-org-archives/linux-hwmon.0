Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF40468C39
	for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 11:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786621370; cv=none; b=pgoY38229a8S7z9BmQlEMpKYnMv+omsTT98xr3sWuRI987ssvvh3UVzSLGFmxb5CirYm4jdi2jH+BPgg16DsY3f2srPO9EQX5va59YeikgvO2KG38mIq9OdAEM0qFFN5THncyz8jgL++HXTURLnjlZ41loYO7zzY6hOXlihwAXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786621370; c=relaxed/simple;
	bh=I2n4qjhhhXqOV6Mw3XAqQ4bd0fYcs3KsEhWb2f3luH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xs+NGUyc2LWuESiNRupGMcGhRwg0vZsGs+gmuea/8lIC6OY2ghFr+Bz/+fTSjzhTd9KaA5IQ6D28C9kZqb0iIG69WJQKywM4gNDazM3YmNdgno6b3NyrTG9B6Hjq+mKknQVYR6IGBysw5Hg0OAuNFJtSqmHgTThQ9NwKKSaWF48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gX/26Mw/; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gX/26Mw/"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-ca766c1c9ccso437115a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 13 Aug 2026 04:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786621368; x=1787226168; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UOMzmZ6AkX0Pofy8pg2nfdTClH+/W4B3MQMVnCijhO4=;
        b=gX/26Mw/QY1VqODNDa3jCWLzNJXkqIO6IAYIhs4aRj3penMFibzlYb6RZBcQXG6S72
         HV8ToQvUOv/x6/dseG1ihWyydywhDLS3LdjPjCDJj/Y71iNzUDIe8e0yuZyKEQ2n6rkb
         UNBaCM2lk1zX+DoFIXctUfF8XQ4QGZJAXDje5+WDXjDSIYJy0bdBXGCwrWvHn427u1/Y
         tkmcq5UpfVwXcF0bphI3xoNomjXl+4kDf7Em6FrosrvVvnzB6Tc6nf47YKPEZiAzbkP9
         ArU77fZzX2wRrgdcPt34RBbo2Qgyzc7cCNS0+ERI/TEZ8OOCg/LjK2EEJiG7q9TOF1g7
         K0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786621368; x=1787226168;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOMzmZ6AkX0Pofy8pg2nfdTClH+/W4B3MQMVnCijhO4=;
        b=s/KBJj44f+y32dqEaJDhIsMtiF7td2zZgyUsT8jcw5IK1x/Uvz71JP4cDfO3CXZIlO
         eV9MLJyIDyIy4yjWUuP8JeYgS++jL80DkuqH3fl3P8oBYQBM1/Cb0grEakZw+5+aV3ow
         NHyho+MfPDYQPdMWS0ucrpXVPfcsax/viFEX4FKCEklsHF+TaRUhkr60vnp6tD6wSPOT
         rfeoga7pFflC1nP0BeXKyC8BR9uIG3olKvV0xFAhASD1l6ZK1azJQKuoPAGvyJ/5UPAI
         94wy8c0+N9QmsPBWctYiSYULnQz6ceX9/tFK994EusOVU30ZlEUorm5fzo/33gTEt5PO
         DKCw==
X-Forwarded-Encrypted: i=1; AHgh+Ro1mPFCtvidvkqWiCWpWFDD1JtkpWj/PL/nGHsrQ8v6dQRmcSc5DWjXuxq3Lux6KuxI8EvjLlWNkv26Zw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzpBxii4CPzmQnIvLwon/cjUxBtXQiAVSAi3FmW9RKeGgXow2ru
	xMCb8edMu2P1bJ6Esaz7CscjnZW6xLhyi6sthu3VVEG0+tRkmnIwQjSG
X-Gm-Gg: AR+sD13RAGPyMIbjrzbalr8coA2UTL2G90g8BsNBqOYfn5ktCW43Tm4KNACE/Vx8abI
	ZvrzhYVHDsl/CoCnswo6qx8s4bI64RBtt7fXwHyG3eWSPiSdLEH+tTi1IP/DDdKUfkBKZ48ozva
	8jHjm4gruacUZIQAEMMR9p3xr63CAczsjqvdZAQm2W2NP9enR/ocjOwGPncw2QuvviSlz2Qz/qD
	jCmce3tUu3Ouu47GxNn7M79LmgBfYNxyFM4JUY4w67uNkPeH9wvG4amew66noa3KK52geIW7XR1
	2uUHijf/4nppXzCiAnGEWDxvpKsnr0mGwsHGxsk4JQ2I+8BiArN/4tKrXYhY77t9HlwlQplyTHQ
	T6XQ1wHx0x3R1DVW46dne+7jlLyHl4cdbVIoVh4Qj1ayhhmOGvQFhhEWbvElhb953WTLRCdn+yd
	09K1CO+WaCJjvgR0wd6X4mYTGs+VKsNOUXFjZ0nd1gr95y/EMQyWt5DGyXG0qFEVuyq75SoFZju
	w==
X-Received: by 2002:a05:6a00:21c8:b0:847:99a7:c751 with SMTP id d2e1a72fcca58-84fc6e290f8mr4868282b3a.25.1786621368311;
        Thu, 13 Aug 2026 04:42:48 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef5cc4c9dsm919388a12.0.2026.08.13.04.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 04:42:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 13 Aug 2026 04:42:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Marius Cristea <marius.cristea@microchip.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: temperature: (EMC1403) fix hysteresis for low
 limit temperature
Message-ID: <01a08417-3846-4842-a539-3ed0c1f7d6d0@roeck-us.net>
References: <20260813-emc1403_remove_min_hyst-v1-1-43a0d05d9f49@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-emc1403_remove_min_hyst-v1-1-43a0d05d9f49@microchip.com>

On Thu, Aug 13, 2026 at 11:40:07AM +0300, Marius Cristea wrote:
> Remove the hysteresis for low temperature limit, in hardware
> the hysteresis is applied only to the maxim limit and the
> critical limit temperature.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

Applied.

Please use "hwmon: (emc1403) or similar (depending on the chip)
as subject prefix next time.

Thanks,
Guenter
