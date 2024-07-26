Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC9117D354
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Jul 2024 15:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722007229; cv=none; b=iqnX7HlI7PAWr9VXlLNVgCRpQTUqQ3qjS0A4DL3PTBW67CtRY93MT4yVIL5pKsluSB4VQmuC+Gcu3Q9Wfhog76c9UvBhGY8ChwRopWb5c2QhpsSvWzDGFCDyThMg1pUDTFW70hK2z0jweEMhmGt/rb59dd03CvwertQbaNZX4Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722007229; c=relaxed/simple;
	bh=CKJx3GDiDwuMSew/YoV3D4nDY2j1JdDBEPiNuEqaPko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvvGTkLImYljeqGbeeDH6v0uH6OqkU2TfiirOglJBhBZeC90c4Qd04h9GvwyqAjZuIhR47SzKIlO9atqZVXYxE/pYfVoHS4irGI40Oxnzdor8F5UW4u6IaBBW1KyZMEJjTOosoYzfjLjuDsl7lS2/lIjEOzqvPQOwvvq/7U3J5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gV4kOT6A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gV4kOT6A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E80C32782;
	Fri, 26 Jul 2024 15:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722007229;
	bh=CKJx3GDiDwuMSew/YoV3D4nDY2j1JdDBEPiNuEqaPko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gV4kOT6AcT/BcqJGanYDLK81x0s2S0426P2FVJNCutLbCAhPnrjx7r4PhknPqzbW0
	 ikZhdiFvCdLAbjTRrNnWCBosfL35PL8ttUbjTNCKHywjKA8/u/uH7GaMM6ez+Pur1N
	 M9W2dcO8gB1izcaZBW1UG7jprQrITMFBwbCyqEu/qGdai8rPoApPg3LctptYcQ0So6
	 mGYiaExYaH63fLJ4J4aPvFD+qmf4xOsFVlFjiLz/YAnp4sR+UqvaUjPuaNNABh9kG2
	 70vniW3z75Rs66nUpPEhpx2gJAIgl1051mJEKxCX8eJqnW79W8RAP71FAlm91Hu294
	 t3vKr5sbFCavA==
Date: Fri, 26 Jul 2024 23:20:26 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/5] hwmon: (max1668) Use BIT macro
Message-ID: <ZqO-ug_RCTP8yNqe@tzungbi-laptop>
References: <20240726004329.934763-1-linux@roeck-us.net>
 <20240726004329.934763-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240726004329.934763-3-linux@roeck-us.net>

On Thu, Jul 25, 2024 at 05:43:26PM -0700, Guenter Roeck wrote:
> Use bit macro to make the code easier to understand and reduce duplication.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
