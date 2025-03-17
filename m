Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E8D1519B4
	for <linux-hwmon@vger.kernel.org>; Mon, 17 Mar 2025 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742211877; cv=none; b=j6VUIlE0OtMJMJg9OPsJfH/mD8spxCxwHZA+ScORXlA0twtn91YLy+e7vffLQJhI4N6zEUZ3q7J+uz9FMNeiroK9O8nzuCqYv8BaJaAd/dvT4sIhNIdQs3wI/vFVYBSrmlIbFNGBJbv/aTyZzC1u//jQnHl8k35Wf6gEUJr0YDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742211877; c=relaxed/simple;
	bh=3h+MsXQ3NviowYuDoRpuDuLcZ27wMI+GpfSD00VDaIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wpbozo7PUHH9xJ4NQFr8sxvCoVWo79JQBdA16bENCfsOijmbVZI733A2CItjKwbHpGMSYnbROTg4dyzz56MIYqbsnWCJ3WeEDfOvr4rUtZSwEFlECdwCnncjrTz3lIh3LUCQj3sXTt157Y6Ep8I9klvoIqan4opESNovj4UXnyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuTCNZQ6; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuTCNZQ6"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224019ad9edso26079515ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 17 Mar 2025 04:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742211875; x=1742816675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chmXKrjJ+jVf9rZgMgNHJJrzG/IDgi03eNV+4CU4cKU=;
        b=SuTCNZQ6MDrDch3lHcwgm0D0WWsFVK7qNgwY3mAthWKTAD6aHe7nNfjpNK9HkgYFS6
         k+ydBjlnz46c2gQDssIcUkklmnNnYf6lk+fuMsw6AVkpLH3tlIXa1F2HDekFxAic/aO3
         vyfRP27f0K1EJok+TU6Xaw+NSMMzixXF3ncMWfhCs6YeF7DoPd8w+OIhqTZ0mfjPgl14
         OnHeTX0TZ51e6XWiEfdh/v1vjLtlC7S4zspFUBzJBLvtG1GuqVQPFakXAIq0oBZppZmy
         BUraZDVcRMBwaWO4nXfLsPyE7aEJop1Hzz8PFQqAdhJ/RjtJC0/TunvkjyDY6PZ4d5bE
         9RSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742211875; x=1742816675;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chmXKrjJ+jVf9rZgMgNHJJrzG/IDgi03eNV+4CU4cKU=;
        b=hsT6xPxhhhTpnSmVvlZBjQXPJeNjJ76oeTEKS3eIOjNpGZzQYy21yeC9Kx055GhbzE
         QlGlBCZiDd/Usm+xySdJW2akqtJeHRkOtHw1dsDYX07V19tRSfvhAb1f6zRmtsGESQSA
         RhitdeD/GZ8ageYHpW4KgvMa5C54Wz6zyxehQ9DHsJttl03dhzz/TRTxYqw2pjZ/XhAy
         iB0VBxZyanzlCP0kxvMonsoyuhSfAtwOlgWpGVb7UzjA+2IfQHfliUA5aeyL8jbmv6Ey
         VSzWADSlFgOcLr34limi0Bp3hPhIyZv2/WEwNuj/fAKjC9NCZxTmLoCYa89QanmztUgD
         2FmQ==
X-Gm-Message-State: AOJu0YxaxnfGZ9KHL9UktS6NjE32auG4tNUtNPxSCbEMgR7+r6HXZVqc
	iq6YTJVZ+KgrEYB09UxmpOCprA5EEJlmzpGGLiBubum8c56g5yub
X-Gm-Gg: ASbGncvjzSAjXXCoybXXmDQPqxXtYySZinNWiIwYHAOye8qsNQls9IKHXk45CAOvoDt
	3Ma3gqJ7RNaUG4f7I4gwuuuiurq9dJwG4Jrww8sW0QdRAcYusgglptRhVhcEBiFx8jpMTBIP9wF
	dlX18fOCID3DxZ+v0T0C+Zx/w+tZ/bkxZSeBGtW5gUaEIodpaPfm7uFP+vqc+6sOoTnq8BQUeyL
	5B5VBEHzlMJhHlLD3I39FATbaXXWNF9q59pmlRSVVHNNSSKWJrzSMgqpTvUmvWevZErr6iJZRCu
	lsemvppXnrPssG0aM0qbxuXZMNZsLJsioKNCyqZ8415AjeW5ttlWlvnFyA==
X-Google-Smtp-Source: AGHT+IFOSVIHK7rx1GLYfYtoYGmQq9OYwN2DN3hPwb/mQ78sSSten5vXO5d5kmcfyZPtb7ECFNVL0g==
X-Received: by 2002:a17:903:283:b0:223:3b76:4e23 with SMTP id d9443c01a7336-225e0aff8cemr150454155ad.44.1742211875137;
        Mon, 17 Mar 2025 04:44:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c68a7f87sm73515005ad.81.2025.03.17.04.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 04:44:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 17 Mar 2025 04:44:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Tasos Sahanidis <tasos@tasossah.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH] hwmon: (nct6775-core) Fix out of bounds access for
 NCT679{8,9}
Message-ID: <b9ca1774-4752-49c1-b406-43eace2d56a0@roeck-us.net>
References: <20250312030832.106475-1-tasos@tasossah.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250312030832.106475-1-tasos@tasossah.com>

On Wed, Mar 12, 2025 at 05:08:32AM +0200, Tasos Sahanidis wrote:
> pwm_num is set to 7 for these chips, but NCT6776_REG_PWM_MODE and
> NCT6776_PWM_MODE_MASK only contain 6 values.
> 
> Fix this by adding another 0 to the end of each array.
> 
> Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>

Applied.

Thanks,
Guenter
