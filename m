Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24EBD189BBB;
	Thu,  9 Jan 2025 20:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736455480; cv=none; b=H1+B/7ntUo4QZ86H1F1zk5ecWfIxll5EcvHsggkMc9Z46f6QYYMzpHWmfTFHgUrd1sVf5BtMC9EJqzYvMsndD2UEQVn9EGURW+/nZhOIaOlCjtqHcjt59QIFkZrw9g0XIiENZQyG5aJSpEVmuKA44XynH54b0VmFUrqA6egyd7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736455480; c=relaxed/simple;
	bh=rj0eHvUnDHI7KsFXjEirRARkIR326mthBlYTYe/8BmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kp0pl+LXCRnGG9Gx6wvGeho1sqs9hLlRfAoWh5NpUlBE6CcaImPc2UHh9ep0DqFc27Cio/2QpAZXgu34dPaWe/1Y2+0v1WW+FCCZ+RQOcj5KcxEYB2SZhxSTbVRp8dkPy2rZN5BTWGdwdkRrWS4TTqliklcdy3C5zJO0P7+pjiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZoOwjQk4; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZoOwjQk4"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-216395e151bso16637925ad.0;
        Thu, 09 Jan 2025 12:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736455478; x=1737060278; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NaUtMyNlc3yQOEbfHg6hn7AN/xpmvI0Le4tqzy2d5jM=;
        b=ZoOwjQk4wr6IBARQwgrnDhSBylBBd5LhO2uwGccEzlaWK/dBpkgccNFHzeCymH4LUb
         C4k70coLMAAje5x0HTn2KZEA3RNtDUyN7Zvx5NmX8SegreKvRa/h09dyAxWyryKXgkxb
         VhQA6f8keyOApM9BCtwLkcNErXg9Qrm7GP1eLXMo1Z3ZmE7nlVdPs9yl2SkeOkIaILmw
         rrtfo6ZcWN0Ti1ldLgl0PS6ZkINNWCisfOmiOtDLBrYmXWsfLek4coNphNkiLYFBDvLW
         q5PhtFRvp1u/GujQCGJ1T0YQiSSQLh6+DhjB1OUWIycjzXwarIPDRUbzFf6F9JiB1eum
         5+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736455478; x=1737060278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NaUtMyNlc3yQOEbfHg6hn7AN/xpmvI0Le4tqzy2d5jM=;
        b=lbwNvmCSElX+FgAjftCUt2Fado/UALcSWdNssBmyfa8U2Y/3S+0M4rBzqPlD6muFSK
         R4MiBN5UVRgxIBTFGqTNnNPt2QMUPZjP7tXN7VjSaVmmR4K0c6os9yGwDbn1Xe8RDigD
         XZRXRXNKZJAf+wHIPNuVR+NT5q2+k4M2KL+le8/4CHT2OOltdcIyQYQQiYBVh2W0Kjcq
         +3USygDuTw6OxkKY20WsD9WwEGSyEey3xA2oArYSzmba+0II7NgbVsjc84MP9H5+SHzG
         +xSzqUaYeMXdJqld7CHZxjdSU7FhIKBYJhAZBE14SLAYCHM7ZOfuGyFYGetlB2792sOr
         xuNw==
X-Forwarded-Encrypted: i=1; AJvYcCUKmIqDM698AwQytWUsUBUCmxofMpyTKYWDm9UMEOR5RBxDaIRad21kMzkbagJ4f1wOaO15ktk0ZobSYrg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1X75d8NW35CmrEOQHeqHwZbegoEM7Vm81OI9L0OZ1pUpvl5GH
	ZjYbMNH6edmuMY6Un5zBUeJE2ianMmHJRXUXckGOUUr78eSbCFYYQMPHsw==
X-Gm-Gg: ASbGncufxiJH86ZNv1VDACMo8KaipueVmUC3e6p3iIzNsJvIzCcq0UYOpcEnwVxTmh0
	nhWP5WgXh0CyF8LVnBPcyLtirRpfnukx2zWmeHzPrqOzZzxturpKOImAy3KNimkFZ75YDMx3mMy
	pLOlw1W3JR11sqOqUj8gj1q5Gib/AjggUHktVDmZsYspn2tVPLuXJhNs+8QNyb+B0GX+oyFb/aG
	zEnkrGWPkQ5k04POHhQHYv+5peXJSem1uPsmQ6duL59vvUh+p1sledq4FmcV0+7uQYmFw==
X-Google-Smtp-Source: AGHT+IG2Ht0Io/HlWOq251fM+QqLV49oMUCNJAmch5kkWexwnaWoadf4KK3pBp+ImuycSxBRE1qPAQ==
X-Received: by 2002:a17:902:f544:b0:216:3e87:ca00 with SMTP id d9443c01a7336-21a8d709174mr60721465ad.28.1736455478411;
        Thu, 09 Jan 2025 12:44:38 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a31840e93absm1706534a12.20.2025.01.09.12.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 12:44:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 9 Jan 2025 12:44:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Huisong Li <lihuisong@huawei.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	jdelvare@suse.com, liuyonglong@huawei.com, zhanjie9@hisilicon.com,
	zhenglifeng1@huawei.com
Subject: Re: [PATCH v3 1/2] hwmon: (acpi_power_meter) Fix uninitialized
 variables
Message-ID: <bb0531b0-ca1c-47db-be84-9009604c51a4@roeck-us.net>
References: <20250109081708.27366-1-lihuisong@huawei.com>
 <20250109081708.27366-2-lihuisong@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109081708.27366-2-lihuisong@huawei.com>

On Thu, Jan 09, 2025 at 04:17:07PM +0800, Huisong Li wrote:
> The 'power1_alarm' attribute uses the 'power' and 'cap' in the
> acpi_power_meter_resource structure. Currently, these two fields are just
> updated when user query 'power' and 'cap' attribute. If user directly query
> the 'power1_alarm' attribute without queryng above two attributes, driver
> will use uninitialized variables to judge.
> 
> So this patch adds the setting of alarm state and update 'cap' in the
> notification callback and update 'power' and 'cap' if needed to show the
> real alarm state.
> 
> Signed-off-by: Huisong Li <lihuisong@huawei.com>

Applied.

Thanks,
Guenter
