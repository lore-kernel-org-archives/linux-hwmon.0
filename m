Received: from sendmail.purelymail.com (sendmail.purelymail.com [34.202.193.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AA738DC0
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Jan 2025 09:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=34.202.193.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735897392; cv=none; b=RFVnloyOeI+4aqe0XX0NPsOiT5XDrcWtj42Aa0kUk/Ij/sgv7mOhszgLBX6nsLisluRsNgjxKnoWp+VYMkUskq3xkgzwMUh9oNNR4JOaiQcI9Z9d3F83CBYvBLuUA4oGzkNdf+aRP7xzLrrIstoiG5m70sJuabfiN0Dvrl2d51o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735897392; c=relaxed/simple;
	bh=IN9uo6WPQ8ThpIm3/TiKdnZ5CchrOkb0f3soHYSzdHw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hkaavBRrTSXtNFDJcD1+IjncAjsQW8fLJiugeOD/ee7AgueusmV/MkZ5WXyx0QV0bA/ddabRcvGv+pM1aw1Ia+CyO2OXAjrDRSOvf1ils/0Nc/msgQD62YH4F6Vztr3QoiXiqlHC2kwBRr5aYiGTDpyeIc/p8kho3xqgVw+Qi5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com; spf=pass smtp.mailfrom=korsgaard.com; dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b=aaxnmOyV; arc=none smtp.client-ip=34.202.193.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korsgaard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purelymail.com header.i=@purelymail.com header.b="aaxnmOyV"
DKIM-Signature: a=rsa-sha256; b=aaxnmOyV6tIbtOPHu5KPGsZ3FhvWRd9YRQ2PyHcmA1BG7spdsLdoUwRrWpRAgNUPagF+lS6Rg0f7CmUMLi/DBrj2ouTx8mr1SIr8XEg9ud0pRkWlBVw1tygi50TlU3IPcX0UgArPs5wbJrVJ50gpn/wILhaRypXvCrCkpTfS9uMMr5LT8fS38X54F1VO+Q4o/w4A0fYIxapqXfAQ9h7giQ19O8xlF3ouieuI0KWgFjxUfbIFEI4zsOi8jPML6Z4sRB0Y8FHbAqSm3hJ2WBaDXG87BEY/SrtCgP2nUTYYVWmzGQXmMi35vaVwEV8TXHjFUwZ8ReA5nEbTfSyLv6B/KQ==; s=purelymail3; d=purelymail.com; v=1; bh=IN9uo6WPQ8ThpIm3/TiKdnZ5CchrOkb0f3soHYSzdHw=; h=Feedback-ID:Received:Date:Subject:To:From;
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: linux-hwmon@vger.kernel.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -2008162100;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 03 Jan 2025 09:42:46 +0000 (UTC)
Message-ID: <638f0623-87a8-4d96-baf2-f567325929d5@korsgaard.com>
Date: Fri, 3 Jan 2025 10:42:42 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
To: Krzysztof Kozlowski <krzk@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250102175041.822977-1-peter@korsgaard.com>
 <b3b8aa28-24d3-4952-a8d3-7019ad4c63de@kernel.org>
 <348cda09-cc54-4d29-975c-ab28241d8372@korsgaard.com>
 <e31c51dc-4e35-49fe-9838-207e2fb273ce@kernel.org>
 <25a1b5bd-437c-4136-84d4-e1eab264d062@korsgaard.com>
 <3803fad5-0dab-491c-b2bf-47ab888bb1a2@kernel.org>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <3803fad5-0dab-491c-b2bf-47ab888bb1a2@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/25 10:35, Krzysztof Kozlowski wrote:
>> So if we agree on default-pwm, then I can send an update (a v4!) with
>> the typo in the example fixed, OK?
> 
> Yes and we go back to my first comment about commit msg:
> 
> "Also mention here shortly how Rob's comment is addressed."
> 
> e.g. we cannot use default/target-rpm because of foo bar.

OK, I'll extend the commit message and send a v4.

-- 
Bye, Peter Korsgaard
