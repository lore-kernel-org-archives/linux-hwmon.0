Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30FA37F
	for <linux-hwmon@vger.kernel.org>; Thu, 30 May 2024 06:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717051119; cv=none; b=jDV+5ZeGUYtQvsCOo73fUvFUj+CS5jSGOOOU4OiCYwOyHcBjBZ75wG9E+aCJjsWbUiNVarIu0T3FtUQYIl27pXPrl5mByODFhaITOfwpPzC0KiU6YS6BKe/zxAZO54o4r0Mf5G9myeQXcLz8I9itJzLiWAEVFNwDsNtfvOx5fqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717051119; c=relaxed/simple;
	bh=wqaWWw1fzODS5irvNsb2Y363qkQ4FSGffJnzy7+TNVA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CydukWRJRV8Ladpj1XCD+HPK2bRaIDVPbpcgFF5h3z/6/1KoYKrNavZticq99P1NoqvnnxBj5SJE+Z2Hn+QlxccSfpnOrdkmNhWngWnIaGHpy07Z0GTFW0S5GPajvH6nbNPrD8EucB7UNdryB+Vn021gzrjNZXplZwVKaqGaikk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePKErYLI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePKErYLI"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-421140314d5so6372165e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 29 May 2024 23:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717051116; x=1717655916; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wqaWWw1fzODS5irvNsb2Y363qkQ4FSGffJnzy7+TNVA=;
        b=ePKErYLIksJMD+xlVnfafMB22opM63gKevJzLyvZQ+mG295PE0b86M68ff8/oCnro+
         l9D9KAKMIKa6hZu5EIFtYUxwY+UNkUlWnczJe+UG3bXDkQHVivYTI5rPtEux8o9YP9sd
         Vh+ogqeKN5C2A9JEJaZu0wa0KEhlkqAew0koojWYy8BJfVzaKLhgfV0ueMetLIVukTZv
         8nDWl41TjfiMdHgWyNMDyyu6ZPv4XA4pOedHcE9G0Zl26kV63QSo51WhaoAKlNG9Yf0F
         Sn5dIp5fCOw4x2t01SLFgX3MKiRtY0FaYKKjVmle/w6ZhzFy9J31RIQb11YYjxEzY/rU
         PiXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717051116; x=1717655916;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqaWWw1fzODS5irvNsb2Y363qkQ4FSGffJnzy7+TNVA=;
        b=gmOhUwT0evO5gKIXtFYg/LM10q4MPtzewBiCrnQliUWUgVrP4+CTnIMoZztA5XEFLr
         7Uc1LPlrwLlhAU6Dh1bQJiCUUOTaIhvw70Hn/WsAxkqT4/Vedmo2+ec36731x6Nyz5/4
         xfMmVrytmXVGz16rFPmGcM96AaL8cuNfn2KbWVGDByYbB66B5tUcWdcE0+76TIhi2Os/
         Oo7oNwAq/0QtN95cuGZkt+/YDaEaIKJ14yLKcshOMLmxE0RVPfZvbe0HaS41H0ICccaI
         DIEqI0NxF8y9bYmAagrQ9VEHYmkcGCKKaPRH9wpJNNlwJ74l1xNpF8KZeoKSH3HC0Klb
         ectA==
X-Forwarded-Encrypted: i=1; AJvYcCU4IpVijBttjjWtSuF/0/X8954y0zvUToBNQdZiF5ucaUZBaKR+a25yjlzl0g9zceuD17W3Rsl6/uZGikzTnvHkQdm7L3pFuPqAQX8=
X-Gm-Message-State: AOJu0YxGfkMqT+iUlTuTc7iMxBssclD5w4WHWEiLY0zmsaRcDviBm13y
	/4WrKA4bVgjIUjS2y5hQMuSBI9piLwWcfYFdle2KNG79FCtBOgyvzwKIDKq6DqM=
X-Google-Smtp-Source: AGHT+IENzE52Wndt8Bu8sDNDUxUB+/r0IsSRouZXEd2ODO4P9obiyNgSA5SMgW4oj7JLvSv+tg1OTw==
X-Received: by 2002:a05:600c:4789:b0:420:fe60:c387 with SMTP id 5b1f17b1804b1-42127929682mr14481365e9.38.1717051116367;
        Wed, 29 May 2024 23:38:36 -0700 (PDT)
Received: from ?IPv6:2001:a61:35f9:9001:40df:88bb:5090:7ab6? ([2001:a61:35f9:9001:40df:88bb:5090:7ab6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c93c6sm16479235f8f.85.2024.05.29.23.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 23:38:36 -0700 (PDT)
Message-ID: <6d6ec285c74afb68ca448b0188903cfeb375ccd1.camel@gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (lm90) Convert to use PEC support from hwmon
 core
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc: Radu Sabau <radu.sabau@analog.com>
Date: Thu, 30 May 2024 08:38:35 +0200
In-Reply-To: <20240529180132.72350-3-linux@roeck-us.net>
References: <20240529180132.72350-1-linux@roeck-us.net>
	 <20240529180132.72350-3-linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2024-05-29 at 11:01 -0700, Guenter Roeck wrote:
> Replace driver specific PEC handling code with hardware monitoring core
> functionality.
>=20
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---

Acked-by: Nuno Sa <nuno.sa@analog.com>



