Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E06D207A3A
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 19:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763406054; cv=none; b=aDzyxz5dY8i/258MSxv1bEkEzy0+7YxjqT4Bon1py9ntzDEKyVPO2N6xY0J4LBxzVW0fH7J3Ot+Vwk4p3zwMwwdIA7wggSpvQRRInn3vOSXfWkLJd9tie2HwiX2JcWkrgltADT++fsErjNtlRhPa1myOMcj3lP1eo9FxpN92E5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763406054; c=relaxed/simple;
	bh=9LwQ8cgiBx+GR9gi4Ze2NRYHzMsmpVYF+u+bBwx5cCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TFBSjh8mEy+YV7055T8gGxBuXku7D4cIBHZR1UHMpIRv2du3ZHSGxNg3AtiKIZacUVK2zmN/5jwzjKMaWMqtTydd1ZeK7i8CQKAmebCc5B8+P6MlAn+gbXJyMyv+0i77gx7odKT3GASFNfrTF47TdYEwbsnvtcSQ8KOlHNPILmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bb7vhjgo; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bb7vhjgo"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-29808a9a96aso48216295ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Nov 2025 11:00:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763406052; x=1764010852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H0lS2cED24LXASEO8Kaw1E9xKUmdy8WEPj1E8PP+Wtk=;
        b=Bb7vhjgo8i3MdNxVG4EuzsP0kY56sHhKC0hWXy3SNDE+0Ky7g2//Vfq9gp+Z3YGBG2
         kEV2VMszuPQ4nQazsSKgdPOTiRGD1zm95jdORpTJBag6XwmEn5c2/HvrxvuQ0/2Y921F
         UvQBWH0YZMZjhyeFp2YU/N52BH0iW//+scsr+miVtegB+9hZP+42GsqTErMJdr37zFTf
         YF7gzWQjdjmNsm/SlxP/4ZKN6wnkOMpf8uEmxEjzhHoPjE0GreCvD45hd39nEQskXra/
         bg/GnRKMnZp3vn2z/u0j8s3BNDcw8sZ4BbHamAFyvnzIlSksGSxQ/4P1O7k3ELztEwXd
         9h3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763406052; x=1764010852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H0lS2cED24LXASEO8Kaw1E9xKUmdy8WEPj1E8PP+Wtk=;
        b=XpGKfR+VnjYglsRzonYkLIPmRVetPApHn386A35ilN0/4EEMVB95DQcbLc+F7HEMny
         k4QgoC0YWa8jRRFdHahkyo1Kza/hLCFuZKbk9+EzMsNFmJfQlAvDwQv3Zerr0bczLiU+
         uGUV/ZUVatqVRRZztgbeTKmdYmmds904PhuhGIt0KWy0YIxkcn+uFZXoNmhqEiqsuoNs
         +IFd+wesNeRdajzMWF6v33Trtg9SS0u6vuRgWdhODwqvzxkvLDIRzPoPhF9U/Sq96Plu
         ykVHZxdcCndDv0jN1xMHS/nn9VzYJ4MdwDnEJgWj3KfpPGkfFF+hZzQwBN5bOX2eSNH0
         nXiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU56CFpE+LONes9+0TUsZh2n+Mg5LjgGzy4PhQTgKefoJgRIpkK1VGErcTcjdPiHOe0DCw7Ot2+fQj0zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ/xsw2iq9nr+aOddNnLh43p4Zlv4eo5BJdOvyaiXPElp6Mjyx
	X3J4vJmj387Jkmkp9tdMndRfzvf8MHdji++wSxZYUOCAOlNLnpF3AWjd
X-Gm-Gg: ASbGnctctWp3V5yZsrOu1j8RGyJP1x17ThZrESXnolWCx3M1IcCUiwRriioGKNwh3Fb
	/63n4ZjbIvJ5QJsyHV0ZbhDDzpnU8cOOsHSnZnM+14dBEE5m5oxCF0SRHYqo7eGffpgLpcbG7c+
	XK0SnAakkoF7sPZHl0Tcx3sshwDr91bnwFLUeW94F4Wc6onReiAigWNaSVNKl+cwFCgvg9EZfHP
	Btv9ybYlNaMSWZAYD/Xvx3aGMjjLfRyDRZzb8sl1nkXwWIayoVa0vCSmcwbHACjv23WwrAlvoSS
	B+ag7D/oCCgPwc0EInsRH4TsBHOE02crIjuINAY0MX4IQYImg/GW4y2dn4QpoWXdh7z+OD0Com5
	fvX/hIqV2fnXCwkhK4SsKaHePJd77ooGNg5biQzAnaUy/pQ+5n8lKG4RBJFtttQJ0SXSeqizg7Q
	D7wJaV2CVsbwjWLvjs0nddMop7RKLt3aCFbkoz8WJBpEYI
X-Google-Smtp-Source: AGHT+IGDVNZOalPoeGLRx0StV1WyF6OuSXplI/tFFH2YjaxRb6M+ZouwxCgXlyJ+r8uHMpC01NlQdg==
X-Received: by 2002:a17:903:198d:b0:298:2af7:8d26 with SMTP id d9443c01a7336-2986a76a26dmr169206325ad.54.1763406050080;
        Mon, 17 Nov 2025 11:00:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2376f6sm146281525ad.21.2025.11.17.11.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 11:00:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Nov 2025 11:00:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jean Delvare <jdelvare@suse.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 06/11] hwmon: Add Apple Silicon SMC hwmon driver
Message-ID: <7a445358-ce9e-4180-99dd-1a771c8ffa98@roeck-us.net>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
 <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112-macsmc-subdevs-v5-6-728e4b91fe81@gmail.com>

On Wed, Nov 12, 2025 at 09:16:52PM +1000, James Calligeros wrote:
> The System Management Controller on Apple Silicon devices is responsible
> for integrating and exposing the data reported by the vast array of
> hardware monitoring sensors present on these devices. It is also
> responsible for fan control, and allows users to manually set fan
> speeds if they so desire. Add a hwmon driver to expose current,
> power, temperature, and voltage monitoring sensors, as well as
> fan speed monitoring and control via the SMC on Apple Silicon devices.
> 
> The SMC firmware has no consistency between devices, even when they
> share an SoC. The FourCC keys used to access sensors are almost
> random. An M1 Mac mini will have different FourCCs for its CPU core
> temperature sensors to an M1 MacBook Pro, for example. For this
> reason, the valid sensors for a given device are specified in a
> child of the SMC Devicetree node. The driver uses this information
> to determine which sensors to make available at runtime.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Co-developed-by: Janne Grunau <j@jannau.net>
> Signed-off-by: Janne Grunau <j@jannau.net>
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>

Applied to hwmon-next.

Note that I can not apply the devicetree patch (2/11), presumably since it depends
on the first patch of the series.

Guenter
