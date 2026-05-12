Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B80E25B0A0
	for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778610764; cv=none; b=fkofgTeumDne2xvEzxPx8Q/oKMy272IqPDs5TW46rrdBn9kxlfBF0+OIcPnqABiEXEPvDuzdbECgQvGjBHD5540J5A1aGg6HzWYWM5oKjb6p2MTCNMT4HeioT+tCNznhzQSJo0TFafMhUZuRc0m7J9eExdcwpjBz5hOsr8poBis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778610764; c=relaxed/simple;
	bh=TpQV7EfOpsbYJ6QldzBf1Aw+Bi4z2zhrb+GGulcJC0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qxwLhIjkcRNXMLwNWtWZxdYNAWu0XnN2gRSevCsc7aAGHbZFH/zfbX6D4lF6iMgSjgviKixgvXyuPYri9PA6uiIaXPfLBQZYkP51sA6hD+eWPuGqBrkkGNGH94RSaHw3QRkzXlpr+YjA3iG4COzypNSHJOw3Ve82BA5Me6jhHjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AtPNbU5c; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtPNbU5c"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f3c623322bso9756551eec.0
        for <linux-hwmon@vger.kernel.org>; Tue, 12 May 2026 11:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778610762; x=1779215562; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ja6bKCcVCVMtzZDOZ+vitgR4xNzTf+japdav6A1ckx4=;
        b=AtPNbU5cQIFElvPpOV+3AjXxGa6KKDxF4gg54N5qtJFxx+NBiS0p5jtt/a6Z6Kax4S
         Clz7A1bBVncTpWtSUBi9x7Nr2mqLQ9TUQRBRuAp6ovc5x7jm6XqW9t0XOebQ0kVB/vmq
         lBr+ifXFou8204pYNFi1olZ63fmEOMeUfsLHbMz092t703G9XmV3yo3jVL7akVqXrFW5
         hVBtDS+kyO8YK/fMNLrMRfU2A/7fsoAJNuMkkftlwELr54+vn6/sk8IU3zhQe2yogSSN
         76HcGOQXfhBGI7d4IMqKBnC/ZinkqEoy8zgQAQ7imvnpJNXgV2n85oz16hYRs5MLOt16
         oRPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778610762; x=1779215562;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ja6bKCcVCVMtzZDOZ+vitgR4xNzTf+japdav6A1ckx4=;
        b=VUTMV/ZYtBlGZJx7oba1NWIPViUo2g6I3SemCSyBggNNU6oJbgGydWAy2nRsiadxD2
         bFG6r8+u+nGO6/ZoldQJ9OUS4oOAOgLT6qKVRtihCnJ9pKGVB1aE5z1Hpb2E6UORwb//
         hIK2MaxBLFmVPEYq8PVKd5/8a6T2s5qZmJTReS5+oCJqC7MFo4nypBhCSDB2LGg7wpYa
         uZPl2e+YHmKHNmra1I38esWPmNH9FTzKvqlsa8dHNdE4YvOU8KoXoGTDUGh97l4uZMmZ
         Wvsk8eIZU1qOgfOkzjj/OI5SPX3USH1Kxde9AQNg2P8PV5pTujHT5I0A/dbIjay5EGLP
         TE5g==
X-Gm-Message-State: AOJu0Ywa19BURgHv0fBFdHQ7l4Of0GCScv+QEDBokbiZDAYP/cEIwgC7
	IuhJ/4V9/9vibBAR6k64L5YzY5TDM7NKlBRYWJWmjBLsaCPwSm0d275FpjhX+w==
X-Gm-Gg: Acq92OHrSy0ISWP+0s/PZ8uD/I/crdO0NMLtGDeQ6x6CbbWdDbS3M3wGYxtkezAynpb
	XSoWRaUIOhQDNPaTciK9cPdGju85+Aujqjw23CzLocrbPnx3sSp4Rmt6C2YY2QkILYqKkCnLasx
	/Nal5eoM8UsO085R932DFKco5/DSxSwSsUVGbztAN6lmyqv8uZEZLLJ0kD8nwxmgRudL4L+ArZk
	bOu9MGxpDWhA8+sxxl6L3MYyZtY2SFQr4NcZcj7MTpOd2bfYZjGGm1Fr1aJy9DdTsRGFEa3VfWJ
	XYX7OQjzgznkGBAh9zDRnGzD5Yp4rJTMoFfDIeeR3iqQEOY984QHfA8taLg+vQrDzpDx0NYtbOH
	599JrX04oRwSnJvh1ESJnZWPua6rxzkhCtxXSRqev1OyI/dgnUSj684l+LSKRb1JJuO/XI8wyYM
	TAcUYyEAqBVxaaaQaZvXiPP2/MR2NooY8Cyslc
X-Received: by 2002:a05:693c:290d:b0:2d8:df01:d9f7 with SMTP id 5a478bee46e88-30117a7ad80mr157863eec.15.1778610762401;
        Tue, 12 May 2026 11:32:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f888c469b6sm19080122eec.24.2026.05.12.11.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:32:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 12 May 2026 11:32:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linux PM <linux-pm@vger.kernel.org>
Subject: Re: [PATCH v1] hwmon: (acpi_power_meter) Check ACPI_COMPANION()
 against NULL
Message-ID: <c7b6cd59-7ef8-467a-a5f0-b1882059a8ea@roeck-us.net>
References: <5068745.GXAFRqVoOG@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5068745.GXAFRqVoOG@rafael.j.wysocki>

On Mon, May 11, 2026 at 09:54:51PM +0200, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> Every platform driver can be forced to match a device that doesn't match
> its list of device IDs because of device_match_driver_override(), so
> platform drivers that rely on the existence of a device's ACPI companion
> object need to verify its presence.
> 
> Accordingly, add a requisite ACPI_COMPANION() check against NULL to the
> acpi_power_meter hwmon driver.
> 
> Fixes: afc6c4aedea5 ("hwmon: (acpi_power_meter) Convert ACPI driver to a platform one")
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Applied.

Thanks,
Guenter
