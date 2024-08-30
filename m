Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC8A4199FC5
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 12:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725020961; cv=none; b=agx1ulEaGiYGPDdFrZFe4jyai28e3fcLUfd1CntQnVQGlaH1KdPTXW3MrkeGoTTWD0BSSb/5AH6YtrD342X05kBm+dzTiDBk7MBSqch7gq8ZtFK0XKSoZjW2SPiF9tociXC+4f4j+fL0mGjXvTZhEOYQll4sB2Q5Saof+MnrQmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725020961; c=relaxed/simple;
	bh=VoGqyEzbmTqpJeab++VhPaxF7lJMeQXKXHpj99pt96g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T0fGDS21cpBHL6Sie1TWn0Fzcjgy2nMetfCkztK/ym9lYdscIxi0TuHyEaKEinvwgI0zg10HL5Z5obLtQvpxxN5oyF1cntWii438NIBbdUCZvpMm25QNjk0/6099wXBCeuTY14swITGmsHgQoZBxymvJJTRFp98Z9tRuZ7u+7Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQ3z6p2n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQ3z6p2n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE9C3C4CEC2;
	Fri, 30 Aug 2024 12:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725020960;
	bh=VoGqyEzbmTqpJeab++VhPaxF7lJMeQXKXHpj99pt96g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fQ3z6p2nKKyIx4rmmJThvBsI32h5ujjUb8Wd51TPp0K8J9bw01h4rJnVWg7OEdJnz
	 6c4UEVpJ8C4XP2pX298jVHUoTeYskZPfc61+2p1HHZ7fqN7m86/4uOF7i553hULprW
	 a8Ju6KnhmhbwsJ7943lALImKDYYfR0duzc3da4jO8E+Cq3BJJojrOa77eElzqBpIuq
	 XIqIQnzfK72bSDxrTIw3TsKZN14DBoyQuPTKiPDSZVxlNiUhlxH8+hkzcQQVv2HGj0
	 XxA1u4GmMOtTOTSJjySW9YzCRexnkXfDz1jp+ZemVzYzhkVvaxQJwX1oYJyKl24PLO
	 qPJSvLCoe3/pg==
Date: Fri, 30 Aug 2024 20:29:16 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 08/14] hwmon: (ina2xx) Consolidate chip initialization
 code
Message-ID: <ZtG7HIQZ-0lV6gRP@tzungbi-laptop>
References: <20240830010554.1462861-1-linux@roeck-us.net>
 <20240830010554.1462861-9-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830010554.1462861-9-linux@roeck-us.net>

On Thu, Aug 29, 2024 at 06:05:48PM -0700, Guenter Roeck wrote:
> Move all chip initialization code into a single function.
> 
> No functional change.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
