Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A1A184D
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 04:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722140795; cv=none; b=KV9U6GW/gJDe/W1SG7BQ+BapVFiAVG1pQlWu9Wm0iLmHxFFmUYy9B7P1mR2nPw6EBz+LJwLAVeKrb1ZVsA0RL3tSN1aRGYEbUD6UD5HgdA2K7v+iLN6ZkJl78bSuohJ+jdb/I9mPW/g+5Ok1b2aLvA/R/fd/63KrN5NFTt8O9Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722140795; c=relaxed/simple;
	bh=wcnql1/Ah2y08f85dsvxW/vLwzhU+Zx2uctxdegIDaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lMyNdVC27Nv4TuzVVwGp1GSK0fixgyixQaAZe9J+GJOuRfjftz0BoW2NpRw3AKZJcsZT8Z6XstG/IRSE+2JHgwsIdrxoeVi+EPww4eo/fV1UBWCFHE4JR+obUdNP7L3McNJmDpMglKeLeQZkP7TV9cP06Ief3SmmT6OA5aat8Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bxkKqKE4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bxkKqKE4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94C3FC116B1;
	Sun, 28 Jul 2024 04:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722140795;
	bh=wcnql1/Ah2y08f85dsvxW/vLwzhU+Zx2uctxdegIDaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bxkKqKE44Qx5Q0N2FGs3NeDnap3OjOpuYOptOpERav2nTTHxT6kOpRlO3+mP716He
	 IQw9WhfLcEOL3CX+NO0dhdDrUl1IFMJERXae+m7TPzVeQ8iWerva3SHpRb8yGWZ+8N
	 TXCtW8alzHdtfKDRQDkFyuOVUoiadUZkpzjIGm11CgM86kqwtRi+1D+4v951Udsic1
	 SSZP19DEarxcCWROuLV88lsEVRzLztZc0+D0AmWq8ShaRNGJlckv9Hzyjmq+ZmkYTU
	 WR4HKiK4GzUTdUACA1sQqQFaukx8QExreGD18ioyyKhSqh0qAeSqnu9IN19ysi0gh7
	 ECh5LX3+tFSLw==
Date: Sun, 28 Jul 2024 12:26:32 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 6/6] hwmon: (max1619) Improve chip detection code
Message-ID: <ZqXIeCZoTGAFpJEq@tzungbi-laptop>
References: <20240727143820.1358225-1-linux@roeck-us.net>
 <20240727143820.1358225-7-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727143820.1358225-7-linux@roeck-us.net>

On Sat, Jul 27, 2024 at 07:38:20AM -0700, Guenter Roeck wrote:
> Bail out immediately if reading any of the registers used for chip
> detection fails, or if it returns an unexpected value. Drop all log
> messages from detection code.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
