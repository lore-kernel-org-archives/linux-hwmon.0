Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0FB92222B2
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 23:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771715066; cv=none; b=h6cfb0buMu0PahuOKI5HKYuLVFJWIKrdAt/mhLEK0CIoGnAWwTeSHgojOu2A+m4Ww0XpxJqoIQRw2SnjoRZ+L0H4UfnH/1UjbADF7TCOH+rDsOnLxmXOesR4m89Q+MbcM8G/ZK4JJj0n6OaId7HMhjhZmoJw/NgXzIpH8+nE4bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771715066; c=relaxed/simple;
	bh=F4CLIfytilJvnTwA02TvCs0S+RiRZBok6Am728cvIBo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jo9CHFsSeaah/XAwQB43UWvXxYU6KnTFlR65Wsn95JmhluwehiYqYOzdzu9T6wijUlXzEu8/wdWwSjtIwORDhm5zDwOpy1qhCjzVTARyse6KNMDUweSocsdaAg2t+7aP91Yh1F0eiEV8wkc+KopUjtgBFERohxZQk5DpcFjGl2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UTrBQoXj; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UTrBQoXj"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1273349c56bso3865341c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 15:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771715065; x=1772319865; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AgyBxQobX6hLEZu+PS4ltH40DvIKcprpQ8pSAJQ08kQ=;
        b=UTrBQoXj5bZlw7ltscyHYy9b4PsZ9yAy6H9R35Ufl4jyD0q3OBHP3Sbd0GX4bAdHke
         7UW6lWtz5n51bZoZ25ajpnDsCRlktmul8y/MacL/e6bRQ47N+OzKDLS55tMBCU464y+w
         O2s3MZpsJsjxbMxycIYAz3azwfscV42CeTAVS4KlR1xYAWtGDv6zl6FdtwYkNd9YUARz
         9W3J+KvImqY0T9bbBnoNTqseQjY2Aqdd/dCwBlUD1jfYyoDpwAfCXv8E6KdUmNWGiSJh
         AjwB9ty6y7x1ol3iKMks9lRQ3qM9OXxQvh2/Dv8N7uDSijvbw3LuaDwp21XqxRhrBj2L
         GK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771715065; x=1772319865;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AgyBxQobX6hLEZu+PS4ltH40DvIKcprpQ8pSAJQ08kQ=;
        b=gDr6VVUKV9TXpz15aWkPjgzLulpDgXspSJXgxk2CrWXVFhfZVDtW5QCUmu0BCErfNR
         aHo5NTpahNsfQAybn/q49/6p6UcUail6ZhzMGS//ca4SbV9sqY7IeW0xQ47KOETXT2t+
         fQcdlnT5oq7WE50OAuftwu0vO53vz6kepBJLGQ/zePBL7h28DE9beDRyluD8sr+pO+dr
         iZI7CSBZKZyi6RwCUbG4yZR4JZ/oZ5uhs1f1Rxj+Q+/jF1bHBbTiLvkt5hOtgQTt7DRu
         XdCfx/v9cw8dOMDJyy+mAQtRut3nreGg0O3pzzgr8VqX5Lnv0OP2qMohEWH7T5vbJOTy
         /Vjg==
X-Forwarded-Encrypted: i=1; AJvYcCUVY9Nrsf0iELg+ePiCrVo4jKZGBKlmRe0TJKZuMrz5ZeO1I9sH1xodLwHldh8YGU3SOJlq/eVyOpGhwg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr7VGOSI9xePMV7ajOLpGUwW2xLm6BsJKV7MatEGaT4bzutyfn
	0DLuQBiO5epFdvQmY1AdJz7yRXAFjSlhHFlUJ8AgBjC3SniZ/n8SR/hr
X-Gm-Gg: AZuq6aIGtjcikOLOq+goCOwtat64wJN2g452rN8+0sCgbC/N+HYLB4eo07+3m6zRxSF
	CQwjJgBsNswUy37erBYr+D5qp/HMX8WjFSVBCRoesvcox+RQ/TQdpL/QIoQeRwFa2ec6BrD6zKJ
	ZVU8uzNAM5A5b5JOF7v2kMaKCKpmnWDj6m+xiBUTdMLAptrKDu2bKVf3dEdJt3M2Rhip3aWaX/Y
	Ewp+ARlVSA9O33zTIB29dM6lloVHWpPxaY1g1+UKfwxD0HoDV3AWmj22q5O/Ef/EZJBputyHWjV
	6dOxtpvUnork2mdK+qMbtfQEA6JGmuTtxEYp9lJVyL3Xo494/vvrv+U9ka9px/vxKdnUZxhA9mT
	0AGtM+qe69oR4X9wh98iccxm4rmsE7T8PEk8+Ku0EMNpIQVXtHqiL6QrTKM0BH/HkvhTIuRqbp1
	Y5wVjq8OcLbDi7n3SLCCd+1imVVyOSh9IacWgP
X-Received: by 2002:a05:7301:615:b0:2b7:8b4a:15b7 with SMTP id 5a478bee46e88-2bd7bb38617mr1921205eec.16.1771715064847;
        Sat, 21 Feb 2026 15:04:24 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dbe82desm2224270eec.20.2026.02.21.15.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 15:04:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 21 Feb 2026 15:04:23 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>,
	=?utf-8?B?VG9tYcW+?= Zaman <tomaz@mono.si>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH V3 3/3] hwmon: (ina2xx) Add support for INA234
Message-ID: <aebd0678-bbcb-41d4-99cb-6116125d72a3@roeck-us.net>
References: <20260220112024.97446-1-ian.ray@gehealthcare.com>
 <20260220112024.97446-4-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260220112024.97446-4-ian.ray@gehealthcare.com>

On Fri, Feb 20, 2026 at 01:20:22PM +0200, Ian Ray wrote:
> INA234 is register compatible to INA226 (excepting manufacturer and die
> or device id registers) but has different scaling.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> Reviewed-by: Bence Csókás <bence98@sch.bme.hu> # v2

Applied.

Thanks,
Guenter
