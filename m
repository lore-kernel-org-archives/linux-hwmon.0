Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B507221540
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Jun 2026 00:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780878399; cv=none; b=KHXe3/7Iiy3Jfk4EOhb3zywfwgjVSpGXmIzg0eO0V1cyVadu+yjVgb/sEIIgK2i4xia8yCq+p//AMxGx1MGXYZFsPdEoUsKnSQbNord4mk5cIuzBRRUvqlz0hqnUZTjTuhF9KQZ43vWRHeDfNWx4OXMt+YnpL6ulf6NPernRFS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780878399; c=relaxed/simple;
	bh=1dRoznK/VTj3OQFZQkwRe4Djlb9mPVbPD+VPPJ6ABa4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b8KK10lz0wPKQQev+ASZb96n/OCv7qUkg8zYJPqSb6VoQHwkyDwCIcQBQq6Qiyfhi5iQLks3KxztvU064uk9A7Ik7guyowCqVyQF8yQBKjAyZh/6VyQbYY8Lnof8HPu97iYdSkt0hEjp65rz+PLIlQzeID+Tjx7kgNQLKGO1paY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0eDuIex; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0eDuIex"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-137335bc3caso4410893c88.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 17:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780878398; x=1781483198; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wowHEPEKD5v1QyaBsiHTy32gevG3QPn/2xj8ddr2K2M=;
        b=f0eDuIexaJ3vmvHyH0alRtY2KgdzhLDLQUhazEh/N3aeE0lPk3a2u8E7cFpJhmGhO7
         pVx28e1DgefR1L8fC50mnOPCGZEGxMX4K6GYlubVn+K23yUSPIPtqAJiyNGZz/GWJGFD
         UxUMM/ui3sjtr8NoxGi+/f5lutChKsu+DJQNh61CmWPhqzzJbpDaYPW1eX202xpP9MI8
         +xIoxdoE4rNADxpnVXmK4F5rqmwElA1lirUtHLDB5gWxxvK165v3/UJuTE5FxEn21XNF
         tK1C4U5y9IpKH/GJcpHCp58LmtHbv2f7qzDN876n/Z0Au0nTBvUiXR3lZcduIm7rQL3r
         3fWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780878398; x=1781483198;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wowHEPEKD5v1QyaBsiHTy32gevG3QPn/2xj8ddr2K2M=;
        b=Ss6YbwctUvrsJ6rFQOmrY2GAvry/9nbPb4T7+sJz5cKb7MO12gUumm5cY9HVg10YkQ
         3H7aVDZaaDtRioeEWkUeI6k4/DzywCYY3h6CssuJredr2tNf9m+bMzDjd/sU8SQGzh8D
         GRUfJ/CJF0y8s0FVhjwb+dCK71SRpqDXE5qcjX6e7KIgLxEFv5z1ufyNVnZmGGBpJBOA
         T2KZg/XGW8lYfHPWDfZV2tI4QtoAJ8PiLIkYAm3uYN0IrW2FP+FQG4YH2S9+dmgrBgSt
         D48Lwvy57dfsITR2prKdqLtHeLMgCzjqdJXN/PsF+AqOjOGhBkE0m6PqOMzmdoB/qgWY
         qFRw==
X-Gm-Message-State: AOJu0YwXwn/ToUqNuUUIai5M/BS1VtC2uYIoQxNc5AB/N0mJ/l/PxRBP
	CrRShzLtN/A0grA138I6Gom+s0iwZn1ZCgvKMYGisGkWObK8wVow07Sqo1N/8pCv
X-Gm-Gg: Acq92OHRlZRC+Ievr/Uc7F49a2x/TSyA9FH9UQW8IQQP4MsN3utSOVet8uCl6P/l0A4
	AcJc69NhaSCrkKZEyCbDz77GUcPe6i+CK8lMnZoCAA1JEzRs6lGtBePYAoZWzGtSfoUXd5GvIHt
	cr5HroVtNQRmXEoMnTnByKGrvb/+JeTIgknwA6dWpWtMYXKPExZb1CE4ZhVNTIIaDL6BXXl+8oG
	U+GlrSy7kDOg3aUIo61h/TzpvsC4f2B+jfzokLhmeCNNEUkwaB8zdYo8hFeQsqETTKzm+fDRcpU
	Ah1ac0Ay+zUPkH6MQtZG/29TweKFtbAq4okuCZ2FDluR5YkTiaCnHwjpzG/oz4A+835LbGNZG20
	5jNz+Lf5e0omi+K76sIhM4tQfS6fxF8gNWy3vnLgw6bY03p+RrVevHVG0kbdmHDILebmPdVfWDa
	uMVy7h86enRuQXwk3ZriuPQw32WquSNipbxMiKD0rARidcZw8=
X-Received: by 2002:a05:7301:9f0f:b0:303:f295:4db2 with SMTP id 5a478bee46e88-3077ae8e8femr7706616eec.0.1780878397494;
        Sun, 07 Jun 2026 17:26:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df191d0sm22469998eec.21.2026.06.07.17.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 17:26:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 7 Jun 2026 17:26:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] hwmon: Use named initializers for
 platform_device_id arrays
Message-ID: <3fec337c-9d51-4af2-9376-ab5db1495d95@roeck-us.net>
References: <cover.1779894738.git.u.kleine-koenig@baylibre.com>
 <25d38df8db42d69f33fa30267c9fd5ea058223d0.1779894738.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <25d38df8db42d69f33fa30267c9fd5ea058223d0.1779894738.git.u.kleine-koenig@baylibre.com>

On Wed, May 27, 2026 at 05:15:53PM +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Named initializers are better readable and more robust to changes of the
> struct definition. This robustness is relevant for a planned change to
> struct platform_device_id replacing .driver_data by an anonymous unit.
> 
> While touching these arrays usage of commas.
> 
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Applied (and updated description).

Thanks,
Guenter
