Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C02DE1E6
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Oct 2025 20:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760647520; cv=none; b=fU/FODw94Be29Nejlhi0yJ9qgkG+561g1IiMvQClC035U9N5fUnRQtc0srLks2if8aMGFcJsa3nyEgUEDXYkHtaR0KxF48jlAEs5yswejV1WTIgTYfIJSlLL92b08CIlvOF6Db1mkV3o2BPy73ZtGjdiSCQzzwaJnPyrX34WQWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760647520; c=relaxed/simple;
	bh=LQm93xfB3+yzk3o3RVUPECs6OYXcIa6l2rSYnVhGsQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RGNZ87H/GnQ0jL7Cp3LubTYAsWe8uXYVkRUZVDqLWWAHD+5+bjJuM9Wh4szbirqPVLNn1s4dnGNkI92JZKwwADPk6q9v2c7AsC7vQdqxFJmf8m2BU5bK7dNgWI7UMeAo+P5ZyObyMtDm7aoVT8o70m0a01VVc+0f+W2jGlng//k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPe1KlbI; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPe1KlbI"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2681660d604so15489515ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Oct 2025 13:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760647518; x=1761252318; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUvcmGdyk/s+djMaF72W/xAp3wl/M6XbYfreGPpZef8=;
        b=JPe1KlbIdSyOu3J88HkIq88P4f5McdA0vuUvfDOi2k6OO043ToBJKWNsdSAIb+uZdy
         RO1xmxdzRAOcazUd6tq0FJG5TnPEKvfctbFx8Ghd0A/xX+NFPhElmBHsCTeKUoP/afMR
         b5Qd803YdptTTruWa+1vV/U9I5gM9cEmyIDzzoQnFaL9L3p4TdLscQ4EdS33p036bZ3k
         0oAmeV7eHQhnd+MQnV43AT3hyuAidpv5rlY6zDEMSPXCJMLX4xXYTtgsHWzxs5tTFj0a
         ZdEOXiUYx5aU6BYIM8eMFRPfURge9ugtT/3EdBI0GutsIZEHgYQYfdyfH4AZpJ50WWPz
         Fs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760647518; x=1761252318;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUvcmGdyk/s+djMaF72W/xAp3wl/M6XbYfreGPpZef8=;
        b=XpKpNgR7scbzGjG4kT6Rw2YiTqbx3+joSURRJa5TZ1Ox9h/0PCJtkycPuyF6iVMagB
         5i02oV++HBUOikNMP0Aa0zc+bYwSEdD7LnW2LUxfT87GCI+nzK59WMKh7WOdBG8kDbJv
         IQ0fBFsuAw7Nv8dk+oB9J0ao5EW0ThIkcK146q68J7S/38c1XKWtyu3ryUMB46ItpKT9
         XbLYvKd8EsJW2Yz4YD8ZHJ29QPEcnHUUgyj7xA8DePfU6qh3Fzd6REiGV+l7mb1SC8y2
         Oe25X9scqUuGdasxf9mpR7Mb7Wq4hQ6X/CO45F90Mv9ythwKmILj/bhFQURUf8PLvfn1
         KbWw==
X-Forwarded-Encrypted: i=1; AJvYcCXSPZJMSn6UdpuO02P19jbk32lE+9DiNgLDVzqpmAXSYPqHhrvJ3YIKlMvsuTa+IbGFZofvkIChHQnT8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBeM2XGbK/QNonWDTi2DnyXXdYllUx+e/SIuGS4Rbn/8eXuuml
	j1M9SqqrXSIsC/rJMVscISc5Oq/pgQu8Y2R0ApUboXBkJucPOneAncSskR6UhA==
X-Gm-Gg: ASbGncvZwGWAjY9ak8DLONJesQVmu2ZRaXamBo+67tAGeIc50OLzZLpUxLqkLcM+dtz
	VtYQe41MLvRr1DFjHdLyTWz0XG7JUtyMbAaBQcKdjsGslyFI69Y7M9Br5HB6xRN6TsvJJT37Lb4
	YuuXiy7ngA/fRHO86ORC3pJEgpoWY+k8LQo0nUIFcHPeGVBKwK2HkwoQXQNML+oHemq21YXpOJ8
	XKOR4gbEmHwyBVl5jGzYa+YcIH+3x+ul79e1xFgnMtR7EdHit8SUU/SIGelq25T09N/5VwgISJ/
	4e9dAxURVvhCAI2d0G2NUMa+RfshLHDgrZZhSW0zL6FmSCUp0evnbmbxYDUIK4Y9jdEfW0Ora6E
	I3oX8NOZ5Lyb6HWpXw6CWZ/PpAKISyhPfSXpRBdGOGH6ExFCnSJdHKQmJolMao9viOVSbeEYSON
	HmJWfI11sTxO7o
X-Google-Smtp-Source: AGHT+IHWDyq1dm9Vttu7p/9WqIA1DfcPLIV2tAzQ/oZCb7NoSTBpCr8dofKYEIYS2Mhjh4zeWUBoYg==
X-Received: by 2002:a17:902:ecc6:b0:290:7e29:f59f with SMTP id d9443c01a7336-290c9cf34f1mr15308975ad.27.1760647518516;
        Thu, 16 Oct 2025 13:45:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099372c4fsm40248595ad.43.2025.10.16.13.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:45:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 16 Oct 2025 13:45:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: trivial-devices: add ADT7410, ADT7420
 and ADT7422
Message-ID: <767f82f2-d153-451c-a330-91ff5b37a1b3@roeck-us.net>
References: <20251015-dev-add-adt7422-v1-0-7cf72d3253ad@analog.com>
 <20251015-dev-add-adt7422-v1-1-7cf72d3253ad@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015-dev-add-adt7422-v1-1-7cf72d3253ad@analog.com>

On Wed, Oct 15, 2025 at 03:52:19PM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Add Analog Devices high accuracy digital temperature sensors to trivial
> devices.
> 
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
