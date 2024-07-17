Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AE2F1802A9
	for <linux-hwmon@vger.kernel.org>; Wed, 17 Jul 2024 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721223322; cv=none; b=a+IFqUdeaxU+xaBXoYOrgWOg19cg6YcyoGeMRNjg3tMVFkKJgCLhjRzNICjSlONOV7QN7ZicBDs8ZqTfNT61h0nVumOl2jlG0vqihdPPCYj0F6YIiedtJaxtuCupTdyD/G9cFN9/a6DNPgclbXZzA+JbCFbfmtKugGP3VguVroE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721223322; c=relaxed/simple;
	bh=fKli+wSyQ1eUSazOMrjhdwuNcTrmHEZvQqcC/YZk+a8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0UqVbqwD+kRLQY7j3ihM2BYLkmHJA+5SMufdN4PByVWGTJ4Vb9ft1CONmewfU7/sdgfgxEPco4+6UPwVLgMYrzuTsKbMsqCMTm35byK+i/3DXtONVbslgejHBJtS9VbV97H7BUUcXab/94ISHfeSWUAYp66aa8vlIOevDc6MM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/kDB8RI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/kDB8RI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29830C4AF0D;
	Wed, 17 Jul 2024 13:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721223321;
	bh=fKli+wSyQ1eUSazOMrjhdwuNcTrmHEZvQqcC/YZk+a8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U/kDB8RIMVsCeRKklSToeKvMRX2XfLoNRnGdkprFjK58Ejz9FfG7k58pWNA4WSMbT
	 TzPD7Qd1jrYU7E8HS39PO5Qz2c7IwnuT85C8rLfDYo+gwaQTJVenriSRkkg2aXYsVe
	 ygKSBJtJilh7lH4Puc1M5h2zwXFJWUOhH4oq0/ZTXOp6Sr2nFUTTe9BtiWkIUOslQH
	 S/UFxBVhrwrmkFYUrqlakevCkF3fWuNHa+0Mya0sjZxR+XUlcznlqRqFIDJbfysy/Y
	 +AEofdrtiFDk7RwRhcDYMy35KN//Y5j6P5F5GptNZguwv9ThDuLofYRkC1Kdafb2Ls
	 3EcPDNMfrKWdg==
Date: Wed, 17 Jul 2024 21:35:18 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 3/6] hwmon: (adt7x10) Use multi-byte regmap operations
Message-ID: <ZpfIlogmiXRy53_i@tzungbi-laptop>
References: <20240716230050.2049534-1-linux@roeck-us.net>
 <20240716230050.2049534-4-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716230050.2049534-4-linux@roeck-us.net>

On Tue, Jul 16, 2024 at 04:00:47PM -0700, Guenter Roeck wrote:
> Use multi-byte regmap operations where possible to reduce code size
> and the need for mutex protection.
> 
> No functional changes.

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
