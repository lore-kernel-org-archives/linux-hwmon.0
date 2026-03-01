Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C04E2C11FE
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Mar 2026 23:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772409241; cv=none; b=X2ngNF3EHTBoSlR+rYO3gQy6hvR+Uc7WTlQCtkVuHf0Q2d23Pai2ksROqhhz1lwKp2Jav2Tpc0gZcwrJmYaNCWP26+vAmJLgzdoeff6MtzFHOLSb3TKsuQRSnMs0Lgz8Qw2ULXSglYEdvcNuLf2EFHSbkwfAxzB2iM7pDYyB408=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772409241; c=relaxed/simple;
	bh=a2iFebN5L7jFdqFDZSM7KmflT7Sl3ML/3xj2QmAgu+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZzB+zBuXUOdeOIERUkHpGBtwJvpKiuvG4hQxYMUL0mJFuE9uK+OHd1adOvXKFCUoTdAkmasODzgCGeWTOyAwYtpDxq0nJE0y3LnehuK1HTOVTAEIw/uN1Hy4W9nTSDYL26f8wYbV/mF6MjQSSULBwNQ7mAI7afShqdQtAuoi7XU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ESVA69Dx; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ESVA69Dx"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso3625657eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Mar 2026 15:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772409240; x=1773014040; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JEWH317fbKM8FxNjJAXj9I7cNExo+KpXcRObD8UxbDQ=;
        b=ESVA69DxKtrburl66QmLaNqE4RwH8HU9kRyukHiFokjTfR0Eir3MCP6lF7Nj7GMxsb
         Ws7QmSNlLwIrMcMEgBd5sS5q6Ng8nXID7Jtmaf19NewQ0ELEUwahbfQd1k2Mn2NuQlDU
         mdPdoZjtHK5TDAzRmKYjYHGb7NhtUhpuBUmKJWBMtLm4EV/s9Y/mY8zGUKox/2gtAEQT
         WFi9JO+MVmex8jIBe+A44/8ptGF+pIz4+EQBKfKqd91H8hjZS90Z5Wf8gHnwJnTo1y83
         S6CLmTPNUJjYjNfxa3KzVgVEffmvARKUPHjlyQr4VQF3xdz0HA1crZ0mkmWotWiI8QDv
         xQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772409240; x=1773014040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JEWH317fbKM8FxNjJAXj9I7cNExo+KpXcRObD8UxbDQ=;
        b=VQquvgGb5kMf987KPO52tLGp/67QVtrkY7vjwTfDit+vvx8DeBOlpivJs3yHZvPV/U
         xWoXbFZK+QL6onGkl6F5vHOUCUXTEDx6GmArWWevPEauaryrneA6Jfi9WxvdgoP0CQBY
         ZVj23hLY8UN9sNvGX3xGAulk1AKdGOwsM8zYjAy97B+yUChgtpSv4xGXeYHhf5ncLJGM
         2qy7Ka4uByDTQaj0ezC/IL81w1zqqwIpXA053mmv5f5aeCNvhDi36IMiL1VPkPOXEOlL
         3tFFByX1T9YMrXI1DGKpln1RVlMSWt45xBtxSbbW/QPjAriKOMVBUx65t/QD3Ro4n/6Z
         vmEw==
X-Forwarded-Encrypted: i=1; AJvYcCV4e11L2/FuZ+xws6RScjHDqWfd8fHfyik0yfiu6ZbqtgYqNykvkZFK3BM1CRUT51G+LW43qGOx+SFjhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjBHF9W96bUGTPj7eCxbwsEr++kGzZn3D/RE9Opld21KXTc/02
	/Df/oPGxYso2OTBi730ANB92usaMAqay+EpiEKkM9iySIeBki8FefuqY
X-Gm-Gg: ATEYQzzW6wiySnjvKsMvk/a5lBTmXbAt87wnLMXLtuFak1VOHVY+4CQGHEFVbyYGMyr
	vWK+FSu4Yoi66iKgJUvApRMBFwTnjglwPg+o8hFA4kw7uso3QSGahxqtFnuc+PEg+huna2A6mkg
	R7o7ElKSPRtxL5ad6zgcnJbHfx+l2AeGKpeBeLwYopd67GwWExHwZXdnbCLfOOtXgzonPzeBC7j
	yO7gSFCPHDEYVKCQ2jr+ucCVshzhDLx05Dznko7bKUTWVotxYUT7KDJI7m9kEsNEiojB7GN22i+
	fl+oAW4FRJ16sF2lK6+XN+jOfSaUR8BYR83GFOAKfVjx/aXoarIuSzrMWsRW1AhuS+wYCrPG7zP
	eQpz2ts+3EtW2wA9K6gdWQ5Y4g4CILkZ2QFSt5pohOhL7k52AlBc/W456BUk++i5U8AKOrBvSA2
	Pp14RJz8OzD5Aba37UM8nzwzbYE1F4+e8Hn4aG
X-Received: by 2002:a05:7301:678a:b0:2be:ca4:e10b with SMTP id 5a478bee46e88-2be0ca4f0d7mr701712eec.35.1772409239681;
        Sun, 01 Mar 2026 15:53:59 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdd1f49d96sm8755978eec.27.2026.03.01.15.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 15:53:59 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 1 Mar 2026 15:53:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 1/3] hwmon: (acpi_power_meter) Drop redundant checks
 from three functions
Message-ID: <cc3d0465-d035-49c0-ac0e-f344e68f77d3@roeck-us.net>
References: <5974797.DvuYhMxLoT@rafael.j.wysocki>
 <5085645.31r3eYUQgx@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5085645.31r3eYUQgx@rafael.j.wysocki>

On Sun, Mar 01, 2026 at 02:17:19PM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> Since acpi_power_meter_notify() and acpi_power_meter_remove() are
> .notify() and .remove() callback functions of an ACPI driver,
> respectively, the first argument of the former and the only argument
> of the latter cannot be NULL.  Likewise, the acpi_power_meter_resume()
> argument cannot be NULL because it is a system resume callback
> function.
> 
> Moreover, since all of these functions can only run after
> acpi_power_meter_add() has returned 0, the driver_data field in the
> struct acpi_device object used by them cannot be NULL either.
> 
> Accordingly, drop the redundant "device" checks against NULL from
> acpi_power_meter_notify() and acpi_power_meter_remove(), drop the
> redundant "dev" check against NULL from acpi_power_meter_resume(),
> and drop the redundant acpi_driver_data() checks against NULL from
> all of these functions.
> 
> Additionally, combine the initialization of the "resource" local
> variable in acpi_power_meter_notify() and acpi_power_meter_remove()
> with its declaration.
> 
> No intentional functional impact.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Applied.

Thanks,
Guenter
