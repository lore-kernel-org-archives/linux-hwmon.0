Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660A127B5D
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 19:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707940596; cv=none; b=eEXcu5AkjhhtA9AkTVoKfmbo1u8j7oAYKfuDIC0Jp11y5RrV/iHS1fV/EywH4RGY8Ldh2/NUSVmX1/SF2CLnQJJdD69OYxGQVd2E+hL2SWPEcgkQoy6Juc3dmXNB9HWQ1OaDcB+EXTYfexoeyoz9hQmIEWR+vWyoc3nHXrt2VU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707940596; c=relaxed/simple;
	bh=LVLBgaw3mUc9LFO8JTE4DYzSSwVd6141H86hO2PNxDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0gkXOVEpGREaQyxb36gaUMEUlSOWtox2KeLqFLAptBBdv3hBsLWHCu1T9V4OkNTvZdJgCSw3FtS6vmfcqLeCxPAtNPjdpOntmmpFrcQIwb5qVRRTCAhz3eDvdmiRbhZGo4RsvDRddyCYMAUb93xERZlVuxJsQXlj3NCgo5u9jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aiPRfT0g; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aiPRfT0g"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e0eacc5078so189564b3a.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Feb 2024 11:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707940594; x=1708545394; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yU+DlHKYNmtvQK4f9qJHind1k0omIvjVAm0k8BPfYj4=;
        b=aiPRfT0gw3jffKPfGBcLRAFbsyRODLBmTLp33O/XmHoN/QUvkhCaGBgv6GxQ6dDiaT
         b+yIRgzO+Orl4qod/6RFRLgVz1PznjMRaha5pWREDB+aXt2b2UbTi1Y36mukh5GtfGg9
         xEzygsTc9b/yQsUrZZH86GimgpdAZ+fpuWfk6134wtY3Xc2xZ3482XEZmlc6yR8sYCTA
         rpSrqU+XBv5+Z6JNBiZk3cIHOBbSSk6/3M9er2ISSPm6otQ4JAGwiBhohIZ7XUZw7791
         WPxZPcPq8WGoeJ1rassgNIhCkwX3jaSiHdNeYbKjGqXbe6N2CwptdXjWpEo2jhq+kd8a
         tBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707940594; x=1708545394;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yU+DlHKYNmtvQK4f9qJHind1k0omIvjVAm0k8BPfYj4=;
        b=uAeDo3+WBeahwp4te+4ywLDF/cX6NwT3J3OVzwbeUPUIKZIuF228IX6J7/r7vHM+FL
         v3ygnr/Lh5BM5IsVLYn4AT9ub3sqsjCP6HL19lMElVahThVuY12xteGC3PdV6IMjUhCK
         GTi2GPHOl+7yDiLVJSDn684oGBjj2LrzQM1QoLWidrBKtRbI6uQ34eRhiDFoBNMVGm36
         UBeD0fyHcjkp02Ox3MVGscHFtmENHir8aRlB6apfg9ElKuYyByRByV4eTVYwFV6RxG+4
         VwFU/h/QIe+GImVV4RwEDuQevhg1GulRPw657V78jbY1YACj1l3sN93n83bHq4x6SFSD
         KiUQ==
X-Gm-Message-State: AOJu0YyMncy1Xsz0CKSnWXxqexi7uaDJCQP0OlIcALX82qVRJuEerChV
	bqU4ybHsDPNXim4QciAGj7DsFkxklNms8TMURHbp5BrG/7tYGk6CyY6OqtKl
X-Google-Smtp-Source: AGHT+IGgan9LVlWp/PSWCB0acZ8ySTqjIC0OYpWHhNOByWSLw09fb9NdY2J24Sua1m0neybhpGqRFg==
X-Received: by 2002:a05:6a00:1e02:b0:6e0:d2a9:2905 with SMTP id gx2-20020a056a001e0200b006e0d2a92905mr4009061pfb.6.1707940593940;
        Wed, 14 Feb 2024 11:56:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7mPydaG1Jwe2eKITK9J0xLyTBW2OuNpOTtT3EtV9DztgasK/hRqsbtTzzSSJicX9QPTtlMFv29HkN64sfr/pqzw==
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q6-20020aa79826000000b006e07eb192ffsm9661926pfl.44.2024.02.14.11.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 11:56:33 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 14 Feb 2024 11:56:32 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 2/3] hwmon: (axi-fan-control) Make use of sysfs_emit()
Message-ID: <d9991f16-b765-4951-b0c5-e01f800b21b2@roeck-us.net>
References: <20240214-axi-fan-control-no-of-v1-0-43ca656fe2e3@analog.com>
 <20240214-axi-fan-control-no-of-v1-2-43ca656fe2e3@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214-axi-fan-control-no-of-v1-2-43ca656fe2e3@analog.com>

On Wed, Feb 14, 2024 at 03:36:44PM +0100, Nuno Sa wrote:
> Use sysfs_emit() instead of directly call sprintf().
> 
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
