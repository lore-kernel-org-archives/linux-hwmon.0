Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA31C134C6
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Jul 2024 07:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720940807; cv=none; b=aoLe+EOmBAgI+IXUMkrd8PgiUuIA1BYA2uSk6H+pqhqgh5yZgJ/+Y1tSmUDmPg+OO0SW5k9WyTbVRw9gDt+79q+oPPOr9H1Ls6qV5/fm0n0arB1spiuNyFUVHHnvU0BEo59Kr8gVcf9Wkpp5FU8pbcR5DNixQx2sgmPodbr7ck4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720940807; c=relaxed/simple;
	bh=7oTmDZWxL9i5//Q38dXvTSEu9AzUfkPM67gm5QPJQTM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UPBVnKyoE2chZbBxw3blzaS8lBTn6GiCVuxSEmQTUZ5HSWpU9mg5A4EbaZao7j+E+vgh00X7Tj+r8DUqjSkN8skdyVufkCj0sXtc2EgR1N+6z6eagUHzZbHipaad4iIMn+BHd8ZQ0CzNlzpjpi1lcCLfyyKz9sCIAS6k7C/Hm/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rlr9vJpq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rlr9vJpq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0297FC116B1;
	Sun, 14 Jul 2024 07:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720940806;
	bh=7oTmDZWxL9i5//Q38dXvTSEu9AzUfkPM67gm5QPJQTM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rlr9vJpqlAk8XxAScs6Y9Aji3hioEoAKDb3GtWHynzqleaqqzUoqXJJ9vPEimAEuC
	 wjy3thqRMC9OvAAKZS9MMoXT/Wlbdv2YFZhV/oAKaZPqgWYjb2Er5QLVWm+8rmfspJ
	 X0Ux5PkbkHAD46UIrJLYPOBNw6dDu+CqtAJes3af+XWB9LbVXrt9lb1732lNZME00L
	 faJ9tJG6Ccjcj7ctaAvBR5/mmhg0aazUYptAvopHJsuMIIt1E7g9rndRS7IG5jmMgA
	 3yj5r8a8ydIrZXjkj0NHFz4mMdpxmW5vQxLJEm2yei09gYgufWpKtO9SwoksMPFxJr
	 eJ6gqTzJmwVVw==
Date: Sun, 14 Jul 2024 15:06:43 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (max6697) Fix swapped temp{1,8} critical
 alarms
Message-ID: <ZpN5A1SzNkw1xUDK@tzungbi-laptop>
References: <20240713213402.1085599-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240713213402.1085599-1-linux@roeck-us.net>

On Sat, Jul 13, 2024 at 02:34:01PM -0700, Guenter Roeck wrote:
> The critical alarm bit for the local temperature sensor (temp1) is in
> bit 7 of register 0x45 (not bit 6), and the critical alarm bit for remote
> temperature sensor 7 (temp8) is in bit 6 (not bit 7).
> 
> This only affects MAX6581 since all other chips supported by this driver
> do not support those critical alarms.
> 
> Fixes: 5372d2d71c46 ("hwmon: Driver for Maxim MAX6697 and compatibles")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Double checked with the datasheet[1],
Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

[1]: https://www.analog.com/media/en/technical-documentation/data-sheets/max6581.pdf
