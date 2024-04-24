Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B1916F0C3
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Apr 2024 15:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713973235; cv=none; b=WaACHrrj25nn4Idt3O80kHawej2eZWjsDP1L4va396ptK+iVPsQqfVE80v1NcKEkFxgnkAC5D1KbGFHMLWeRTC7tiditx4064tw4bD9/E9cCgCZ9++8p+cGKTRvAS3CCocLAa2SEW/QoUQjg8BZRwcfXywlz+w7OW6nebP1sAzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713973235; c=relaxed/simple;
	bh=Tu2+814/Dq8TXDCPxBDdBge8JxaQTS/q6ngA7zuMIy8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=K0vwzMP2YuinqhVRUpS5TLKe9KJypS1FbAMz3BkBHqmeCwdycQZnaxIFn/JRdjjkboZmZgclIE2izqRbuvsVsXXZkhPMtiaJPCuzDXZXBuuYBcF8Gb4QlgMB4tokckjtjl2XhG+I4c+oSEnunOhrJorCrz/ke9dHH0LTZn2gEXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=craftyguy.net; spf=pass smtp.mailfrom=craftyguy.net; dkim=pass (2048-bit key) header.d=craftyguy.net header.i=@craftyguy.net header.b=FmEJQvGh; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=craftyguy.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=craftyguy.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=craftyguy.net header.i=@craftyguy.net header.b="FmEJQvGh"
Date: Wed, 24 Apr 2024 08:40:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=craftyguy.net;
	s=key1; t=1713973229;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gg+XCabiBQTUKesq34TeNd0ZwGbgVR9S2ZKLjUE4Ojw=;
	b=FmEJQvGhB2O1nQi+xxwSyVM76v9WM7dULhguJNyJlIFmzs0DpbJQh7WOlrI+Sbz18e/9de
	QKpkvfdU5v6StuNa1GbIEq1N9Sa8ABmz2cUAkRfQPTwmZH+wnpdbcL+uAqPu4UokuzS9px
	LxrEOLowd2zqhpACoPk0DAOyPlVXBUadIIKkZ4XsvsMTKwMLbTGr/RkAu7penHfaGxyteL
	eYdio9d01hTFJpmr2y2rE2Gft6573tv1B+UN9vSaV45r3e1D2hLVZV47wrJc39HcfNa8D2
	VxVK0E4NCsSdVlSS8JbUHDz9ImYNnAySqAIMBQtbxK2KOPn5T4mu+/HiDKpcSA==
Message-ID: <20240424084024.GC5670@craftyguy.net>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Clayton Craft <clayton@craftyguy.net>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-kernel <linux-kernel@vger.kernel.org>, linux-hwmon@vger.kernel.org,
 gpiccoli@igalia.com
Subject: Re: [PATCH] platform/x86: Add Steam Deck driver
In-Reply-To: <CAHQ1cqE_iA0gKmqxS21JMAoFpz-ebhG+axVuUT9P62_JTB9kZQ@mail.gmail.com>
References: <20220206022023.376142-1-andrew.smirnov@gmail.com>
 <YgIu+Lrt0p85yog1@kroah.com>
 <CAHQ1cqE_iA0gKmqxS21JMAoFpz-ebhG+axVuUT9P62_JTB9kZQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Sat, 12 Feb 2022 15:37:19 -0800 Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> 
> Yeah, my bad, will add in v2.

Hi Andrey,

I want to run the latest mainline kernels on the Steam Deck and came across some
newer patches of yours (and others) in Valve's steamOS kernel that may(?)
replace the ones from this thread. They seem to be required for properly
handling input, thermals, etc on this device. I rebased and used them
successfully on 6.9-rc5[1], and was curious what the status is of upstreaming
these (e.g. as a V2 here)? It would be wonderful to have support for this device
upstreamed.

-Clayton

1. https://gitlab.com/postmarketOS/pmaports/-/tree/master/device/testing/linux-valve-jupiter?ref_type=heads
