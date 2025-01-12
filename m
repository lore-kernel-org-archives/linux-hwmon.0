Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30E91E4B2;
	Sun, 12 Jan 2025 14:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736692550; cv=none; b=h2GN9SKpQeyGONuYgksYnjJ8m4bpKKtDQEcHWybZvtr9cEDzTPmXBpm/scni9uMOF+yVMlPXdsEo5Aed9nlHOcq0yUwyyjkfWFHUnc8T+5njzfLZ0K07ZRpGukGFqofgp015fP6ddB0c7KSpqIXh4QKMGjqhULPNeQxCgiJYkcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736692550; c=relaxed/simple;
	bh=ruIk6XmnrMUEwGMBenObzodCb17RA46kXHXPn7r4LM8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMulklwcaw4Yhf3R6c0J6jY49CHYyXVUhnMjEtV5Oj5tmhcEoCF1aWPndEiM+I2oHMAeXjMVP0HAklqysO+20MSM+8jFR/tDzMk5C4KRIOzIYkuxUz6o5vZ70PTPipr1sWpQsV37zdovjkpm/ur9RFkj9lAC2yE95HJ7xvjvptU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPihBXrp; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPihBXrp"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21669fd5c7cso59975615ad.3;
        Sun, 12 Jan 2025 06:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736692548; x=1737297348; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njpu9gDU71TLUi7kUctOc1AGUjmnCtev1jK3FRBpM9k=;
        b=RPihBXrp9TRDwl70DcUgrqFqci5noBg3PLemUlTDR+ULb2GzMQKmiXcX2v4NeafWPE
         tHLWQ7WPR1eAA0ktRDqVE4RP1aB/YUeX0qGz4JUS+L4E47+PbG3995Nrx/9TXHfTEpbt
         V9TwlfzWX/L0bbV1zYBM+gAvp2w/bOnHvEThwXWUaXgaOH8VHk/6KTXhtfGzfxnqB01M
         3Z12qy10CGn8duV7196B6gIjYM63PehHARqZw02LDkgY75CeA1js/ne3Oxexof+UTajO
         4nBzWfO1meF779AZkguEA7KTB1b8HPqQBTd2IqgFPLyQF+BP3vEQK9utbWu8LpVjUcob
         L3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736692548; x=1737297348;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njpu9gDU71TLUi7kUctOc1AGUjmnCtev1jK3FRBpM9k=;
        b=ICWnGdTTJz8MqvAbH0/qm+MICPIkD/XX62F7J13zw/3bstvBNU0mgzO9f3EEOMzoTb
         mwhGeFm6wTaITQNFStHduwZNod37+CPP4gmwfBxrN9xGgJVXCxuaX1IqODzuSNlkk2BT
         iB3M2iqM84dlpiOpdujoom8a5TTJ8cDTMc+t00qCqeqXdZg0y6RXsGwO48svCJZc9f0Z
         S3T4HefwtmZFofVMLcoguI7TFNRRexutM30WLPnIOnQvZ7Dof/DIK28+Mt1/nG2hGjUZ
         nbvIZhogRWa0/n6jRs0PNjfW5vY6BVhoTgK7L3mGy8Tyt0FZ9gQZCrsx5ZERHLf1rtZd
         w/nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWV6rvHjimxVL9ktUIT1GckD7G7BAlSMPtUxk/cFlejdjRMFdKb+o6maXCOLLIdlFt0R6OXge7S1Z2jjA==@vger.kernel.org, AJvYcCXbpaWR04FKyges/aGR1gwzWiDh4br1e+NJqNsRrd78PXdYc5ntjzSzNLoSqVJgXR9cdoa4ZLY8JNWZ2ro5@vger.kernel.org
X-Gm-Message-State: AOJu0YyTTFzzABytFtAD/1wxmqHUGa9xy3A7Y7CtvAr9xrLDV4srALQa
	3rZqRe0f480rOBCLyl7FKc7Al3Mn468mJuE+ucgZW+Zno7fwa+zR
X-Gm-Gg: ASbGnctcy7/Bzcgf7+wz3jsgiYA1i6ja/bQJLwhO4S78aqfItZymozHjOXipGPl7Dmv
	dcjWGf4RvOULDhKqdcIzEe+o80AX/sVw/hvA9T+cklb/E+q7WeOAxxIS/kmiPJXOzJq+ban3pcj
	qQuXMko5KoIM1rKODpx90deeqWSSkmhc+lK38OxnhKe4npTfATgKSYmjjMb6eXuMblbZKjizfhB
	LEbHv7UfaIwwkiJdCAbgg+Tiijz3Q2DIB9Q2Y7YFWVmcD8ryo8zkrbNylFW3sxBFmBQzg==
X-Google-Smtp-Source: AGHT+IGFGx8tnWYkS4bcqjJC701k42aHD1b0LL2UPPrVRkTvliAA4ETJlwuS8GsJiri5OZE5aYGi3A==
X-Received: by 2002:a17:90b:534b:b0:2ee:9d57:243 with SMTP id 98e67ed59e1d1-2f548e9a473mr23288637a91.1.1736692548005;
        Sun, 12 Jan 2025 06:35:48 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f55946985bsm6852194a91.43.2025.01.12.06.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 06:35:47 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Jan 2025 06:35:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Luca Tettamanti <kronos.it@gmail.com>, Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: Use str_enabled_disabled() and
 str_enable_disable() helpers
Message-ID: <2f722ba2-8669-42fd-8193-bb501c328e65@roeck-us.net>
References: <20250112105128.86653-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250112105128.86653-2-thorsten.blum@linux.dev>

On Sun, Jan 12, 2025 at 11:51:28AM +0100, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() and
> str_enable_disable() helper functions.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Applied, after fixing multi-line alignment issues and the patch subject.

Guenter
