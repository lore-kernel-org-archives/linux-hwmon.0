Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBED93DCDA6
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jun 2026 07:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782460174; cv=none; b=CZXY88xTImzTKnMSfafIRfu/tBupCVx0PTTx9tSvmAvFMTx4InYnIEsJqeAcv+xIImvPjLT8qOyO4IQW+n9L2u7E6n2XRPL77LtuQE0yv57LYDyh/zoDPewUtXV2fIbJimECH+KFVEmkPrI3Lds80caLsaSlzUT18MYeMBBX8NI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782460174; c=relaxed/simple;
	bh=dvFcYGe6L1idfk9wGMYrduqPaQs0l4aNwLSYhUvK3AQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQA+jkEtuonXo1Sm4t1QBBwk/9AQeLhWoZRflYWg7gOouNZtaznxmRBpJg7oM/fgLZ99DCHdJc+pd8kdGyg1p5D+b0VvB1jcLToTLgo5MuSvKnXDz5AvTxRMFnJRuvzEm3GQ145Dr5Ov6gjmEhTdBAvtmy/cB9XLcQUmuFi+GEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dkGxPK9Y; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dkGxPK9Y"
Message-ID: <2b620c1d-af40-4813-9df0-b63adb1161b5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782460170; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7Di4YVjFIZfU5+zAiTbJY2s0en/y+uu5qey0tpETgvQ=;
	b=dkGxPK9YoXJRxPyNDIjKx9iLBIQYNTsCpeXMyGgXb0b9XB2wV78ochqztm7CbfsAK1GmkJ
	3vVmKr5xXIod8LEJJZPBspf0sNzRwT3I2i+8wsh9og6gPxRhX6WK/jlG7BFC0bXhGhTuMz
	+GmR5Wr/t4EJVAGtrBxxUSsrO8Hcfbk=
Date: Fri, 26 Jun 2026 10:49:25 +0300
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: mazziesaccount@gmail.com
Subject: Re: [PATCH v2 9/9] hwmon: adm1275: Support ROHM BD12790
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
 devicetree@vger.kernel.org
References: <cover.1782458224.git.mazziesaccount@gmail.com>
 <b209c1b47712b69f17b52cfd7a7a38ed76024ca7.1782458224.git.mazziesaccount@gmail.com>
 <20260626073347.A06981F000E9@smtp.kernel.org>
Content-Language: en-US, en-AU, en-GB, en-BW
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
In-Reply-To: <20260626073347.A06981F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 26/06/2026 10:33, sashiko-bot@kernel.org wrote:
> If we evaluate m = round(k / 10^(-3-R)) for a value of R=-2 and k=35119.94,
> it yields 351199.4. However, the actual code below correctly implements the
> value as 3512, which implies the formula should use multiplication rather
> than division.

Gah. I think Sashiko is right. The fixed comment should say:

m = round(k * 10^(-3-R))

-- Matti

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
