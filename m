Received: from mail-pj2-f35.google.com (mail-pj2-f35.google.com [74.125.227.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F8A3F5BE4
	for <linux-hwmon@vger.kernel.org>; Wed, 30 Sep 2026 22:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790807087; cv=none; b=tJDhDi+EQJb7rkFcUZe/VcTcJP4e8Plz4q3ZHDFoAvveBImrGbU0IaNgOeEyF+3pxJ5e6DpIc8d2oRe43NFkynluCy+X91CJo7AGB0ADRjgjAVGHC7VxdANtxPZEHLtEFcjAMu5+pdclV/NVCQwlcpJ2nzTCVdu1G8q4wqHZ8Lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790807087; c=relaxed/simple;
	bh=v4299bNl+lAPOB6/3VYr1Qulsb87AFZNEFsdu+iXIIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=heOs7KZyDsIOH9oogWlVqc+t0PA7C4MlxKMFQdSWhRFr9H2KE27O5Vq9VvtivS1oDIgpSSenZmzuVtiY4QQV0FdTtIwygmGtF4/ryOejtb/lhDBIbcByyD/9VS3ZthBR/3Tzx+iW0ocuDwSy4DlC1FVs0RoNrQC06SmdQbXglk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rz7JdNCD; arc=none smtp.client-ip=74.125.227.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rz7JdNCD"
Received: by mail-pj2-f35.google.com with SMTP id d9443c01a7336-2dd77300825so31487895ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 30 Sep 2026 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790807085; x=1791411885; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UqD2onkoNKbwoz5eLcMSO+ts9RQq0wVH4NJCZCES+ns=;
        b=rz7JdNCDG8mxKKfOq8WAE4Dy9A5cDzDiIUl0kDifDV8Auca745O1ubZRkh3eEFCt0F
         5xQtSXwU+oae1fzuq7MjSfqU0a1RIYPWGi7gMv9oN2gCbnjHWKTKSVXeFr719Vh1pJ+o
         Tul3G4qRhzGFFok7TEuREBSXk5thPF6ZIUoQpcRODKrBDkA48ieC9iEgjUS8Jl5oSI0g
         c3zykUVwscJFArAiK97PDmhKGRNozh7I5wyXUrgtlzuAYQwRKmcTiJI9JUHSSODHcuRf
         GidZPmFpNI+CmWym2gPQSUbMXJrJiS9LFyzFtJtVVb71lBhOLeERfx7M+4uTf3Lpc6Gg
         CnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790807085; x=1791411885;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UqD2onkoNKbwoz5eLcMSO+ts9RQq0wVH4NJCZCES+ns=;
        b=0OdvNnbZjdKwSxYKNwnALag2Y08g1Q7AUc8Wfo9HTBQ4/0DGiVzq+BHIvxTkV4X+Wa
         zF/WJIz2+hLR6SqQ70eQ1iTs+OOYn+y3RRWtwoIOFjbn8TjqrCk2TD+bBdd8Ddrqd1HF
         faa87SmJvILr64fOKaUm4xWMUVFI+qjq27YDO8RphgwsKy87MUWTCGKsSQCYe3i//z01
         g+FRZCGYmD/Avbet2RJ1pM0y0DP6AMpIBn41fVfK5OypAcQATrlqDgFBRdaM8PSJfNwa
         E0subICN+gKSd578OQVwj4dv9nYqKFkV5s65q0BIXtBklQgZvHCYYdrT/JCxsZC2x7zp
         ErWg==
X-Forwarded-Encrypted: i=1; AKwUvBxd0yK+JpzMyhCYFgDDr0zqFu213oKy6+unK3onmfCOlcgILH2wmIzMHtWiNkB86GU2mc9DbycOYqPoPg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJL/+UdG4mTUg1p5WU0tqvuxqSjrF6vS3q+XqtPBisAfPqNb/+r
	np3mt/Qi3ourLcaQR+FI8f1cOM1pjY2g+hN+4GbqxH1+SN6pXITk6/vX
X-Gm-Gg: AYBFou3rEo4DPY10Dh6wZ8je2NoOqNSyQDdsCu4R/PKkjyNApUSQyyiiLDq6NyBfZAG
	ZP3XzpnwW/OFnsA6RYP/kmdoEa5Ab9fVXhlEFhBoHezIjI9bxfCAsFkRu4ZMfPlBkOFMXbcZYH6
	bMOikJge8FNpkurBohpjdx2UNlciC5xFSW5EjFRupZ03DAUWEaTp23Z8q/LbWx0iN8fRA+2ct58
	4RLJ7tMIGUpHvxMaRgCFFKDAe8vl/pznKsd8n97o/h0JuzGZxIbBHUtEt1GR8+F7fqwoVmUBoG1
	iM9BqBmM1dp+JQENE7Nx8PxikdSHecB+FC+QKgStxMEyRR41IEF1FpiZQIWE79p1/0Q65gyRztu
	oFWuwcUyZOmetuJY+PL0kwiqF7aiIIz01uHVjOgXorOnhEFDe3vyETK3NdT59ahe1nXLEYqmT1n
	qdCPOlsh0KhKFP4iOOl4fLTkVF0MDwtkF+/P7SnIS59Hw0DaS3kQ8GuMcFDubPClGtNxCtstN1V
	z7pvTeNCnKenc4wb9775kg=
X-Received: by 2002:a17:903:1a27:b0:2e2:f1f8:42bb with SMTP id d9443c01a7336-2e2f1f89acfmr13956375ad.54.1790807085027;
        Wed, 30 Sep 2026 15:24:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e300b90719sm2510425ad.84.2026.09.30.15.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 15:24:44 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 30 Sep 2026 15:24:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Charles Hsu <ythsu0511@gmail.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: hwmon: pmbus: mps,mpq8785: add
 #thermal-sensor-cells
Message-ID: <37298c5b-aa6b-473a-8e22-d29ddec12c04@roeck-us.net>
References: <20260930-for-upstream-dt-mpq8785-thermal-sensor-cells-v1-1-6573c765eef8@free.fr>
 <20260930140721.E066D1F0089D@smtp.kernel.org>
 <ar1Gj2XVOCEjUY0l@L20747.iliad.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar1Gj2XVOCEjUY0l@L20747.iliad.fr>

On Wed, Sep 30, 2026 at 07:27:43PM +0200, Vincent Jardin wrote:
> Hi Guenter,
> 
> On Wed, Sep 30, 2026 at 02:07:21PM +0000, sashiko-bot@kernel.org wrote:
> > [Severity: Medium]
> > Is it correct to set the cell count constraint to 1 for this hardware?
> >
> > The Devicetree specification generally mandates that single-sensor devices
> > use a cell count of 0, as no index is needed to identify the sensor. By
> > forcing this to 1, it appears we might be baking a Linux-specific driver
> > quirk (the PMBus core's internal 1-based index) into the OS-agnostic
> > hardware description ABI.
> 
> M. Bot has a point, and it is a PMBus core question, so I would like
> your view before a v2 of this binding.
> 
> Since the commit
>   3aa74796cfd0 ("hwmon: (pmbus) Register with thermal for PSC_TEMPERATURE")
> pmbus_core registers each temperature input using its hwmon index as the
> sensor id, so temp1 is sensor 1.
> 
> The hwmon core counts from 0 instead:
> for example temp1 is sensor 0 for jc42, tmp401, lm90 or adt7470.
> 
> With the 1 based id, a single-sensor PMBus device cannot use
> #thermal-sensor-cells = <0>: thermal_of matches a phandle without
> cells as id 0, and no PMBus sensor has id 0. That is why this patch
> uses const 1.
> 
> No current DTS references a PMBus device from a thermal zone, and no
> PMBus binding allows #thermal-sensor-cells yet.
> 
> Aligning PMBus on the hwmon core would mean:
> 
> drivers/hwmon/pmbus/pmbus_core.c
> static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
>   ...
>  	if (class == PSC_TEMPERATURE && strcmp(type, "input") == 0)
> -		pmbus_thermal_add_sensor(data, sensor, seq);
> +		pmbus_thermal_add_sensor(data, sensor, seq - 1);
> 
>  	return sensor;
>  }
> 
> 
> If you agree, I will send it, with a v2 of this binding using
> const: 0, since each device of mps,mpq8785.yaml has a
> single temperature input. Otherwise, we should keep const 1.
> 

Yes, that is a bug. Please send a patch. I'd prefer the index
to be handled in the call to devm_thermal_of_zone_register(),
though, with an added comment explaining that the temperature sensor
index in the PMBus core starts with 1 and the thermal core expects
a 0-based index.

Thanks,
Guenter
