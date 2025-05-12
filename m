Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EED77248F49
	for <linux-hwmon@vger.kernel.org>; Mon, 12 May 2025 16:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747068501; cv=none; b=oeMZudy0v4XAPlw08mMhFmpx56Mv0Qg1b7ZnKWVNJOeS15TY0xINvSW0E01l3zhx435/lBG95EHcpl7SG2EWU5F4hIOjjl2R98xYtYX4MnpPD0g8tDvNsbuoneHWVqXhE2iAUZpP/mUw7JJ4S8gimh6t9iGYOlnQMmwREDNWuUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747068501; c=relaxed/simple;
	bh=IY49rU26YJbYcLkX40EUYL9NPrB3e/amFtbWggjwwJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tcIIOkxPAMFfgD6lvVn/FMWO3bVnKMqYTs1pXK0jZnjvkECgD9A/Fh0zbMeXpWl+waZrHY3wFqfyEE/WXdzI6xVBXTsBmKjD6+CVZZQIdwA2h5z7DJMHm2orXHNH/yvLYXsIzzeKfhDXxyBmHcRdebXwBimVm5rxPyhVL7+fQPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NhkdCCpR; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NhkdCCpR"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b074d908e56so3079513a12.2
        for <linux-hwmon@vger.kernel.org>; Mon, 12 May 2025 09:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747068499; x=1747673299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqY2vo+hnNZZp47esPIwDf20XS46d5Q0pnX9TeGpLak=;
        b=NhkdCCpRJymgduK/F79xkg9fH5WL+zYmw75BetEz/mCLjQaLpgrnY7YCsIGMfQbB8x
         5MBEZdq5hOYwmM5mO8VRN+XgkKulQeXHc5DKImYdKhr9kQ2hdk4GHORbNzpuKw7gWoyJ
         OvlIi7KMUL1nD+6iki1LBbXGQ7Mjo5/O+m1nOX8S3lUFqsLh0GYxak4YLfQXel6iRdw2
         moMzAiCKBMqCpQSr84cG1/quxRSeMWz6HQIrHhjsmtfBIVzYyu8FTLyjfYk+GwzGfb6v
         TJ5BTbi5ZMyDpXd1594zdw0h/pMJ4ksR4e3aDPbU0V8TQ9viFRYUQ4htv70OkD7fongt
         8y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747068499; x=1747673299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BqY2vo+hnNZZp47esPIwDf20XS46d5Q0pnX9TeGpLak=;
        b=B7wuU61ewRKMWGdU5HklBWODSjfSYYCFNQEivYrHICKBnDdnf/gmgKiH866BERnMBt
         n8llYKH+UGeb21efKps7bbTNMbjd8QETm6eHjHtwXHn90e02/+J0Cjgkrlmx7FsLS0wa
         bO05oW9IPdGdSt0Y+P/TBAC03coDmoQZR2F9+4bgWF6rcyK2BZ6vx1CQbCtnsmqNBEJg
         yqOqP2a0CwDnqonHDJoT2TrxaMSpUKk7Ukzw3w02xorf1HJ392mAb1+7QjcS5pM44hP2
         +hCONAcYO7fkyu0Yj8kBrIovrccwt5WdGKNWadNsthebPuYkcmd3jP+tUZCKoESrzNIO
         tmeA==
X-Gm-Message-State: AOJu0YxKD6+f86SjHbXntSQ/vUtkxHyW0IFigU0Q+hk1JYevPS2AMyzM
	wyrLn4RFkzOUoZ93MbdMme2mgLGuF6Yh5T8S6rWbP3KC55HPGP86b0N/Ug==
X-Gm-Gg: ASbGncvcyHBrKb//nA4WgxyntRwqD8lXNLsz3yNu8M9P51oIr+RnlUJvRt36pp/qLB9
	TawixqWZI7Lbfzb342vOZ7xI+1CkU9J0Rro/1hqsOcq1aPTk90y53T6p81YMCx9NPWxchuq3A9G
	iqFf8q83D9bKwgFO7WjTF0b1ZFteiVkxPLLf12/e2LokbsmN/pNGiUgn3p3kqdK17Rrhkx0yvnK
	sY0cXMDIH62d8Jk1rYcjLoCG9OB5JClXH6cRNAMaJxRM5iWneh7RDYhS5CvJ/wSLm7boQbWcJIQ
	D2MtGA+LC0yomP2UF++zIqniHUuuSdv6HPJTRlUwSmkKJAptqgf4dBNNGdN0XCig
X-Google-Smtp-Source: AGHT+IFWJ7f8mea3qxQ0XvFEYt5vh8W1ajK1iiqowV/f7jcOGBEO0ZvEDVZb5VnK/AS0rtFlDNYMrQ==
X-Received: by 2002:a17:902:d581:b0:223:faf5:c82 with SMTP id d9443c01a7336-22fc8b0f8f4mr170213195ad.8.1747068499168;
        Mon, 12 May 2025 09:48:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544d7bsm65467575ad.34.2025.05.12.09.48.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:48:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 May 2025 09:48:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gerhard Engleder <gerhard@engleder-embedded.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
	Gerhard Engleder <eg@keba.com>
Subject: Re: [PATCH] hwmon: Add KEBA fan controller support
Message-ID: <98e26e9c-5b7b-4053-9d4a-a6cec915a56e@roeck-us.net>
References: <20250425194823.54664-1-gerhard@engleder-embedded.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250425194823.54664-1-gerhard@engleder-embedded.com>

On Fri, Apr 25, 2025 at 09:48:23PM +0200, Gerhard Engleder wrote:
> From: Gerhard Engleder <eg@keba.com>
> 
> The KEBA fan controller is found in the system FPGA of KEBA PLC devices.
> It detects if the fan is removed or blocked. For fans with tacho signal
> the monitoring of the speed of the fan is supported. It also supports to
> regulate the speed of fans with PWM input.
> 
> The auxiliary device for this driver is instantiated by the cp500 misc
> driver.
> 
> Signed-off-by: Gerhard Engleder <eg@keba.com>

Applied.

Thanks,
Guenter
