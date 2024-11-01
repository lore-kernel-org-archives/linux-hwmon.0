Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4001A264A;
	Fri,  1 Nov 2024 14:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471495; cv=none; b=tZqXZjpHa82PMTxb9/aRfXp0PKRs6qrXISAxFNGXSvy7l3pts2Wf/4s3ry/jAYrJtA+VR4dy/2BPg0FYN+RzwRnwgDpfEzMr0sxFKJA3Ex10WaYDlicT1Mz8hsE3TWmsu+KSKpmbG01iBnYBMsgHJMkvHDcWBTBYPl9SyGryQiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471495; c=relaxed/simple;
	bh=H1Nf5Zuqrf4a4EaCx9bWR7JjJiqWRBS1QMmNY6uANSA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JD9XaCTtnk0oHPwJATe+zuVBMsBZgwecOIZkDGbwX0OaaWHYhzAXZmR65KktJAC6hgJiuP67cWY9jrq3PVlsAFPL73jb5WN2RTx9i6QSuhCUrBywGhsjU0HdEVv8SObqz5g+gc/8o7gyFnM6nuUaAq9fYSKJh0ZawtybYyUuEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BfIwzg1N; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BfIwzg1N"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20c9978a221so21127075ad.1;
        Fri, 01 Nov 2024 07:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730471493; x=1731076293; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMN7aZBfReDTK+r9IZ0cKBLFGCLDeA6jAp5THZN/DLo=;
        b=BfIwzg1Nw8Y7u5GZCgz8BKxbtoaVHFbWyyPocBA4jjetUjECAmFoOIz5QjYP+rF31S
         yeGFNWiN2c3orvTXvKZxv9dnBfL5TzPw28EJRA1Ts3vKQUmAn4SL6cwjsyYynatPZ+9j
         P1sPhJL/9x/g5WVG4N7h8Oi6vetDkTY1/3KymAZPa7agsI4OnDQQTo1pn/R2fle5HPTk
         l3kNxOj1YueHDhgSzW/jtVUVdCiqr9oTPkUFirdNZ3IjYmKcPLSgSx0r2WPyROpDvBgm
         ND4VHhmve+hSoPBZ+5drc5GrCGCiVPT+jNKjBTMUs7Pr/ukD0zXRf5DAtouL6/9Jm5gY
         3GRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730471493; x=1731076293;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LMN7aZBfReDTK+r9IZ0cKBLFGCLDeA6jAp5THZN/DLo=;
        b=gkMPzDjXrq0Xkh5/q+0Rurc5G7QwObEXILgkzu17he2MhnUUG39s/jS/mZx5STdrnO
         alm+3VekOn3DfO1gkcYSFN/XRDUU6uPAqLKMjGm5jvkT4f0B2M7W3vxRxY7tb02tcXDQ
         tVuFnTg6Eob+BYqzpx2t2tKTPeIcMXiqpkVQyXZQmrl3KKcbS3vv9/jSpEjRXoXtfz0Q
         CC2cx+EWDJKuWvJrp8H9gm4x8kKRieai4xX4iEAqdpNXxEq+05KDtZp5OxODDnvrq3hR
         PilDkIw1AB/wTHT5UTjEvUP31g2RCI1YOGDZlNM3wwNUIzZc7muct1piI3Fiq1EVMftk
         pgDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVZzR5owqeIZXYji+Zdjj1KNPj2SDi4frYo61fGO2RwfC3h6yUQye++JtCVNzIHY6eODIso7EzDVKpP@vger.kernel.org, AJvYcCWL1qzkfFjdFJkhfgRretFWAkQEsi1IZ8QOakFmEZECSWNLDu59r7+eLMUhowoOyZ3gmU7gL7j6ZPxF4+M=@vger.kernel.org, AJvYcCWxtBjjMQy0ShI9kTP7QcqSxHNSgkw+g5+MovSwmI6XtgkjAiCZdX61y5jI3FCeeniwaO276PQ8s7jA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx31MNTj/x5YFjsoppjBwjE+PsYCcBcWQ1MJ/uWseM+ZSVKE3fF
	MxlOCLHmjcXVNtgAp7aRhozcDdNeCctb9kyMSTqlB4SPHKpy7+s2
X-Google-Smtp-Source: AGHT+IFslmpKLLWtvBiM+OPLZMq7kcq/FZBPqJScvNgvsienlEAPX82B2Ua/08b9Ns9SVbdQquk3ZQ==
X-Received: by 2002:a17:902:dad1:b0:20c:ecc9:c50b with SMTP id d9443c01a7336-210c6c6e9bamr303619725ad.42.1730471492718;
        Fri, 01 Nov 2024 07:31:32 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211056efcf6sm22204525ad.14.2024.11.01.07.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 07:31:32 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 1 Nov 2024 07:31:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Grant Peltier <grantpeltier93@gmail.com>
Cc: robh@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	grant.peltier.jg@renesas.com, brandon.howell.jg@renesas.com,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 1/2] hwmon: (pmbus/isl68137) add support for voltage
 divider on Vout
Message-ID: <6284d01f-20a5-4998-94bf-71e7a2c62a10@roeck-us.net>
References: <cover.1730326915.git.grantpeltier93@gmail.com>
 <2189696bf68e64e8f8e41e71f11194c1f8a2889f.1730326916.git.grantpeltier93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2189696bf68e64e8f8e41e71f11194c1f8a2889f.1730326916.git.grantpeltier93@gmail.com>

On Wed, Oct 30, 2024 at 05:40:58PM -0500, Grant Peltier wrote:
> Some applications require Vout to be higher than the detectable voltage
> range of the Vsense pin for a given rail. In such applications, a voltage
> divider may be placed between Vout and the Vsense pin, but this results
> in erroneous telemetry being read back from the part. This change adds
> support for a voltage divider to be defined in the devicetree for a (or
> multiple) specific rail(s) for a supported digital multiphase device and
> for the applicable Vout telemetry to be scaled based on the voltage
> divider configuration.
> 
> This change copies the implementation of the vout-voltage-divider
> devicetree property defined in the maxim,max20730 bindings schema since
> it is the best fit for the use case of scaling hwmon PMBus telemetry. The
> generic voltage-divider property used by many iio drivers was determined
> to be a poor fit because that schema is tied directly to iio and the
> isl68137 driver is not an iio driver.
> 
> Signed-off-by: Grant Peltier <grantpeltier93@gmail.com>

Applied, after fixing several alignment problems reported by
checkpatch --strict.

Guenter
