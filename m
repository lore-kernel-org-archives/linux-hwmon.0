Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895E1328616
	for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 23:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771715036; cv=none; b=mA+YYTM2X2LZZ+TyTV3Boa32JdSCGGUAYwv/3Nme1XITtbmGGCmdJHnwSLoA9q7AjzdtABeTa9spJkjnvEp0yvmdnu/vG/cmia9EokB9pghHL7BBhGy89cFPNoYRGqlH9zM1NTC8uxY612nOea4Z9Ih5FZu4XFLrYFoDi/mYYNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771715036; c=relaxed/simple;
	bh=dLn7pU8jF247dHaVpsieCO+El8PET6lRNPUBO6uklXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/X8ty0hQX8uG0niXtTgAd2ZdcOKT4gW6JUFZyiLTXQ/HHpComLykotx0DI3pHAV1870hr/kMhlFJvyFc0F1ESpMqUpl/lGBswC9e9KzT5RgEccYWlH3BdNlOfWZe9kwROHPOkgWUu45W2KrcQHSdoSpPSuRr6qNWSo8JhAywLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fyw2GEOD; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fyw2GEOD"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-12758ce1e8dso595533c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Feb 2026 15:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771715035; x=1772319835; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=26KB9AHM3wOxVAVaIjueh1jaK4iOkC93vngU+gNXVI4=;
        b=Fyw2GEODDnwVeWLoa+hnzk76WhYlBzBVF6dml1pAFdtRXPApNdyciYD2gaMU6fW3fp
         O/p3EGGwBiOq/avFbzCIyaWDKeTzwq+DKp6+CHrTgIn9ooZzqm1YM/HyOLS+QbZTrIqe
         FivmHLEM3Yx3cYQjtLBa5M2OG0DJqFSae4vX8oQkLV4bROoEG2vvwZjiksFzLljboQqg
         w7KYNEFu7LKdKbLJKLikTfXqfd5ttgTe5CRGKr9a8mQaNM8nQhKpxkOgo+R+VvmDjBzS
         IGZBJcx2qu2/O4dKZ8XC0sHcmsMd2tHH3iApccTWqBj+yjQl8ojLhkHmsZ2P6nxbepNJ
         ZRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771715035; x=1772319835;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26KB9AHM3wOxVAVaIjueh1jaK4iOkC93vngU+gNXVI4=;
        b=UgQuD++9x4+GPSnQYIHagi5X74Gj/LP0FGwP2/82ef6WbAgd6IubwyQY7fwCj6AB3v
         U0lGdJGtKi5iKtSvwllEOyFVAk3LR2Yo45UjuIjP8Z2dkYtNlX0+1WJxPyIwanFveM8o
         JVsdTcqKtEx6US5K1q/3MapsOVJKLOrKKHPQhpfZjlemLvEeH7ouExi0fKym9hmw+rFG
         C40f6HAcXENdm4LnUiBV4aqv0lUcHN863B5vDlNBYivjARz7xe2fESZgvBd6C5CGECpi
         gC6lX19sPROGCHyeBlOaW+LfJ+86xzifvq1yyuGBO/WTEaJ68u7UI9sxddrSwHmDJVsP
         0H0w==
X-Forwarded-Encrypted: i=1; AJvYcCWbD1KkKXkVinlgjZRXKMrEgzXUY0Ua+LB+Ib0tvc8FpJPwrIP8yqptBcYJQzxoq1uEljvuugZPxHhIsQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrf8mvLvH6LaOwyPw8g7e9KfetpGUzk5mckCnTP4dNSFJXqrxf
	lZEUVkXiSRmxTZ+AhgrpJOkWEEPl8fMilbNI384Ktf8VbFZTF1wAjhIn
X-Gm-Gg: AZuq6aLG6CSR0ke1GfxujEJzcPsNexkwuhx7g7f70COIAdgjPw+i7HO8CPsUdKu/g8L
	2pM9kTP56OZ1iVAxojsnv19UDNMbvDKRxGv90us7PGgChvbdi0YJZT8LcEIhHMGbmFZMwTO4S1z
	6tmBQAwSrQuxgbn8iSuKS/nicCgchXSvXVQWDc7tVC63Axna+w6grd7URYU2SStF1uJ4BxHLEuq
	1dnA3PM2Z+qVZNPocA0axKWXViKPY8iV5p8TfCnLgTBRtE4z+KB+x1DYTqLc8lrcDfoACMosRaO
	tYwWsxdrgctLwdu7utnGqgTAS3pA5Pmlct7QTKZ5OiZDcNTT6RPzO2FJIIjdXYQMtIkqTJb5mBw
	p0oeZ+wAEStt1SFW99lM6DAsKhZ1/DRu/4pcbtNzaKOMuKFquos7FbgP/Eurs+51kyEFcYWxDQI
	99VNLV2rQaGyeZeYhVZNw2Fz7RKnJlAWmT+F1J
X-Received: by 2002:a05:7022:6290:b0:123:2c98:f6af with SMTP id a92af1059eb24-1276acfe093mr2336471c88.14.1771715034615;
        Sat, 21 Feb 2026 15:03:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc167b2sm2066679eec.28.2026.02.21.15.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 15:03:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 21 Feb 2026 15:03:53 -0800
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
Subject: Re: [PATCH V3 2/3] hwmon: (ina2xx) Make it easier to add more devices
Message-ID: <34c879d6-de61-44cf-bb9d-214b73ad36c8@roeck-us.net>
References: <20260220112024.97446-1-ian.ray@gehealthcare.com>
 <20260220112024.97446-3-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260220112024.97446-3-ian.ray@gehealthcare.com>

On Fri, Feb 20, 2026 at 01:20:21PM +0200, Ian Ray wrote:
> * Make sysfs entries documentation easier to maintain.
> * Use multi-line enum.
> * Correct "has_power_average" comment.
> 
> Create a new "has_update_interval" member for chips which support
> averaging.
> 
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> Reviewed-by: Bence Csókás <bence98@sch.bme.hu> # v2

Applied.

Thanks,
Guenter
