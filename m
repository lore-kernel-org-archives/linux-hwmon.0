Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CC3175A8F
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Mar 2026 23:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772409286; cv=none; b=ReV5672fTDv0r0MJuGqsNblriLvmFPLJMStv9bRcKp4/EGXydK+RVLmqPf4dVBbtemAaf1wGdVYmhxCw16s9LZetTyMpWYWdjuGxobQ8y2zkCLs/zIXahVtdTM7O2qaKTIJKJamAxUj0arwTG3OBoiFPeT+t78wZPAjzviPDyL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772409286; c=relaxed/simple;
	bh=rnNj0idF/E/fSfGyipXl8VHIBGr2hqUTrFeP3TUG7Zw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1G0jpr7prEp0mcfMhPJAs0xUHjTlY9yVbZO+g31EPCXlI6SzFpFsaeFLVRLtzxmSiOaVGng5S4UxiA6oHzBpoGwrCHRgp4g0SCWQ/BH/hTx+uXL2izxZUWhrpGpN/Sh3Zbupo+CeJYVcGiLqMuQHsdRdPxlHM0OWP8ALkO1XTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbEtHj1v; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbEtHj1v"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bded9bf7a7so1913447eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Mar 2026 15:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772409284; x=1773014084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hovhJpml0URyC8GLPN7f58usjnnoeDS0ac1Oxzc6nXk=;
        b=HbEtHj1v91beOOs8sJ04IijMTnN0Gi/jml0jYLBEWRfj8a8/DOTDvo2mMfcC3Fj+9r
         ECLXv3zxoeWN8HiJrkU6I6u2w1rMOYBVXLpzFiLkXgGZBtYtG9DSIx7Ty66Ga/QkdUi6
         Jrk63CF0dp3i1Xl6cCyfkze2Ub1WBxMgd+YwSrAGdMV+KDwG2tDckxOvwFIvGp72GZEM
         2iQfaBVT3c9L9muiNpbgFVIIuk7o1Y4wFWY7evgeJGTdbqjs2jWqaKpxet/NT35yy04k
         cd6oYk+Z+LrpI2nCK8P+V3jc0yACH7mRychpUb8fSEvBzftfP6H8wB9b3MP93OcqDGk1
         epsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772409284; x=1773014084;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hovhJpml0URyC8GLPN7f58usjnnoeDS0ac1Oxzc6nXk=;
        b=PwfzCTnLQJbSZk6XCgUZnAav4IjzmgC9nCLwkypqhEYR/dyENag56OwGthDjmFE+vn
         YtQ6crOEn4lTp/Urnqh3Dmo0sK1bIwh0pAN8Zz2/4MiiciPJ92ICLDcEPPDKrL1eG4KQ
         nshkLkXYbD1XT7GmZt96SRrQF5E3I3NXdbTveJzu6Joje7jVh4zMuoUZIAafErr6FPfk
         DOXNUFrgHE1+L5lPwgSNZz8hPlZG2PUTtBpp70J4qU4J+pvutLEyRn8o6DMbabjs+urq
         Uev5Qql+PzJDYBvZdPYS1iDAGrIceRAStKP1qprFpTwWI4QiSp30MnvzGBLyrinrDlYv
         ByPw==
X-Forwarded-Encrypted: i=1; AJvYcCUOysZ07qi+vZMyRXxllHfpVqJRTPP0cHfkHmFhMx0L+apN/J2zDEkoNe11ftP54cesodkJDBTIg8TPqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxRwFJTZqPp9V4qdDssxRge9YWVe66MaFNzm9EIE+s1EjHeS+yh
	OxEhRUlwAsjesUAcM3D2UPK1xTFZrFsMc9Wcxrf/iemjQPH5LOTn5vTK
X-Gm-Gg: ATEYQzw1DL9U+yeo49uVkcpqZENfV28Yw2u0sgC3nlPpZDK/iKHf00VfnhhRB/E/kxh
	Cx/m8V2h+BHdbU73RiLklR0R1qhtVBLuk8Q0M2i7BEbXSYMR7gxWT461v6RZrAM6scitGy6xhwh
	CMxxR47hnQby3CeRhzeoohX0obvZzXTKQaUpIYcHWvHZPS+lqDH413j6eOypa8xwXu9r2bchf9R
	K6uV+WsEQC6/nZlN3UvQYK7i0uRYpfU0zDfnoDoG3XF3PHq92n1+aVtUaNZNhcQqjcdSBCH5d94
	o+g03m2LxTLTnb3i8xrhI5u04CJLBGWtt/+I/agRlj1UgLsdYfhDKmLdo1U3gkUVA9//ng7tKoY
	vaQrogzbnQ8l8nN973cgR31ogT7n+/ABCMgTsRVb70WQJbjTrmp7T7enB5C9wkkuGERh+fzplKo
	1IesMdxWlMofNQMMUvG1GfDLOcuWAcyvSl76tS
X-Received: by 2002:a05:7300:730b:b0:2be:e92:7f43 with SMTP id 5a478bee46e88-2be0e928509mr643762eec.8.1772409284194;
        Sun, 01 Mar 2026 15:54:44 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdfed770d4sm3463985eec.17.2026.03.01.15.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 15:54:43 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 1 Mar 2026 15:54:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux ACPI <linux-acpi@vger.kernel.org>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 2/3] hwmon: (acpi_power_meter) Register ACPI notify
 handler directly
Message-ID: <267b31e1-49ea-4f62-8893-9c5d2f187348@roeck-us.net>
References: <5974797.DvuYhMxLoT@rafael.j.wysocki>
 <2405555.ElGaqSPkdT@rafael.j.wysocki>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2405555.ElGaqSPkdT@rafael.j.wysocki>

On Sun, Mar 01, 2026 at 02:18:05PM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> To facilitate subsequent conversion of the driver to a platform one,
> make it install an ACPI notify handler directly instead of using
> a .notify() callback in struct acpi_driver.
> 
> No intentional functional impact.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Applied.

Thanks,
Guenter
