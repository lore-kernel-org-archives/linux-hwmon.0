Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53A642BE642
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 20:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774902121; cv=none; b=dhD99XSJJEoZzHI7SthSKnVRmBr1bgHEebT91aaHoLQpEWnc6H+qBbHh9Ghu8i+DFKbbA+q1ixTOLT1w7txpPGW+S832GpbDQ7OMZOtx1UXKesMGlzXJD0dTY3J35zY6dvpvPqOK+Z5JFZXRoC8mU2Qvkm+2R4s0dWawEFWjTLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774902121; c=relaxed/simple;
	bh=wDUdRXbyWg/FcpVjQH7wdkqqRS8sKvHrbvQ26/L3kfw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LbdA6xpuClXOalFGS4iHfFPzKdtXqpft/V9jtxFoCOCL5J7EQUTgZm8gvvqBqS4VQNRcONfC7n0mpgQ7hNOLRH7c1TCzshW1yGcc0Oj4ziXaEvAbv26FVFsLdzIB2fRJdibGOga+y1mL1HUFz4q7/VDWBk5mEpuTmq0QiVxEDlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SlyXAcWj; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SlyXAcWj"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1271257ae53so4933391c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 13:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774902119; x=1775506919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4E4wO8WPXrOjaW/CcTmfLYZMHMWw6K4rUG8Uk1gY/k=;
        b=SlyXAcWjRIr1sv+54pHfNeTWJCriAKKmXU+romaMT3C6LKSuLAqgIQfh+Y6qcrt01V
         1n7lBX4Kkp9iP7GxVue4MWGjZu4T3dyND1JCXQ1V9Q/F0K0EzrV6lz1jMvouXGrBTTL9
         64ItHH7QUd865PJJWUFLqtCYccrDYUHrb4puNpOnOQPMdc/e8lB4VtgjeRpdrvIpE3yg
         H9sZZOScHvhrh8X/oialN6NYeVt0r4ZHKY00HHGpht06429H9bugxJ3AaJlpSWjQTVT0
         S6pU9UAMVxyUqGf7cQyI33pWlq1iNXJ5pnUhHeBcW7yxiqM5RcC/cYDSQiLY4G1QxH1y
         0l0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774902119; x=1775506919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l4E4wO8WPXrOjaW/CcTmfLYZMHMWw6K4rUG8Uk1gY/k=;
        b=ejkM1zf8Y+bPqSLlJ1NS8BkJ0/oYEeIrezwrlLVmxopapZwhlqvwJzGrs7+00nRtGl
         97rthQCSOnv+vBantLinBkTTr9JHASFhI33UX7fDUe6boasYe0xTAvtEvT47z4XIfruT
         sg2L0CBbMaD0C3ddW+JocYfjUjg8vrFdoHv/kgC7Poa8fAdo5OQhSI6OXJu29MOglXqv
         9sjqe8MmTPj52YnEzXf9eMvVU2SXp23kwNdLnvrfq+TDdglQ008SG3YpGfYPB7mezlcS
         iYf9/r4kzw2y0XOJIJWWnWsk/thE0qQ7w4AcMXM4AkAIljFN/HGAF1/kgwVBMHpyNVQO
         pojw==
X-Gm-Message-State: AOJu0Yz+ZYINvfA8V6Lf9x5ZsmepQBjMIjyDPXbVBvJHNROdxx92THSg
	ZWyjpNNlD7/YomAyMi+ySNwa4x46pJJ6QZzkhbWQ2pzYMsLhYiV0fZOx
X-Gm-Gg: ATEYQzzosh33Plvn1ZwTgvuOxLKk+AwRYdJZD1eL3Oy0oMKfvVAya0YXyREy6RYLJRE
	5YoPEHSelk6gxrSrx7hudjYP15nmoDMuD7dUJF4ikZWEzfTlXk4Gn1mSQKeAVgAT++96eKy4fhE
	IjogcMJv7gbaIHl8tG01sRMSNUKxGJIWjy4e2BcQkFkW7j0k8iNdJA8vn1zZG5QRqctMTBlqJaX
	fQPAYiVse1pV9O1eZcJ2u6PDnV/SrmbRq25Jw5GNL4WNigUcJ6kcgWL/nlJ/DvgILQOn1IQjl/I
	CYD2D4k+N6xbQVDH8B/HJZkGruA66piBBj+KnofHIE/Iv5EgKKzuT1XttA9iF29fz/umuXDah6M
	xPge2BaIgW+TUPHHtn5Si6XWV15+kXlApKSvhFkG3B+yV6iLlJcekd/I8Y8w08SltjFl5tuAlDJ
	kH4uZnexa4OL28KkNHkmIWnGN/h1jmyGiNzqW2
X-Received: by 2002:a05:7022:6b96:b0:128:cf5c:5356 with SMTP id a92af1059eb24-12ab284be66mr8083151c88.5.1774902119339;
        Mon, 30 Mar 2026 13:21:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ab9864810sm8695564c88.12.2026.03.30.13.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 13:21:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 30 Mar 2026 13:21:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH 2/3] hwmon: (occ) Fix missing newline in
 occ_show_extended()
Message-ID: <f93b9218-816e-4340-8d4f-249159cdfa1a@roeck-us.net>
References: <20260326224510.294619-1-sanman.pradhan@hpe.com>
 <20260326224510.294619-3-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260326224510.294619-3-sanman.pradhan@hpe.com>

On Thu, Mar 26, 2026 at 10:45:29PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> In occ_show_extended() case 0, when the EXTN_FLAG_SENSOR_ID flag
> is set, the sysfs_emit format string "%u" is missing the trailing
> newline that the sysfs ABI expects. The else branch correctly uses
> "%4phN\n", and all other show functions in this file include the
> trailing newline.
> 
> Add the missing "\n" for consistency and correct sysfs output.
> 
> Fixes: c10e753d43eb ("hwmon (occ): Add sensor types and versions")
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
