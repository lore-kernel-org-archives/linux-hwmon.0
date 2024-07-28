Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513B0184D
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Jul 2024 04:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722140778; cv=none; b=LpLpEWI/qiwp0rIa/irQebkHnBFN1UX3Ty5J5FWdPmIQu94yIIHhekJKcJWKZbFQYu+onxupv4P9sMyxSkKUwrsSyjF0UxZOD7U4vA34c4IvZU6rj4ym6vaEXlMS05C3IE6xKZd8HoWZam78PRhFhb8Qj7xTQwBAzsk/8cofzGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722140778; c=relaxed/simple;
	bh=HvC0OYnB6NaAUEQVo1Mfj5QCENrOzRYaT+MKUPsvkHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+oGxcR46rb8B31RRUtq1nVzdB/j/waXSxlggZgva2JbLJAmo9NQGFXUbNegV7JB1+Ub9mqKgxbuvylDNjZCP1PurcvhFdcRelAVaLldp2xomL1iKXP1UsU1UifF/4WzZc7lLG5CU7KYpk+ny0uL4bhTDCwJkMdlRzHGwweh7+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TunLss8e; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TunLss8e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93150C116B1;
	Sun, 28 Jul 2024 04:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722140778;
	bh=HvC0OYnB6NaAUEQVo1Mfj5QCENrOzRYaT+MKUPsvkHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TunLss8eWarRPHd796H4vzXPmiDNrQwz39YHJWSu7SwFTeWXtTa3r6qvl6Y1ImvI0
	 RSsZ6eQk/p1nnn9frTYULlu95vkZhLLus02N5XDvmC5QpVyH2OiVgJlkzc2B69lTXd
	 uduA+W7F/ddyYLZiQTi82hAoNoRmCGiItfQQL+ZUo6ssDKGrVJgmCZoooN2SZATSmu
	 s5aYh6owXINq5Djp3u9NrMc9s/9IKbkQNBmDO5nbP33bjSNySvGk3N6Du4bRncgDRD
	 AQ0Q370LnwfjX5LdAWgvYkCa39O8VYL6z7Lh73o9otkJxfedjYL6yKlL4QnQhIOJd2
	 6Lkk7i4Eim8vA==
Date: Sun, 28 Jul 2024 12:26:15 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 4/6] hwmon: (max1619) Convert to with_info API
Message-ID: <ZqXIZxxos0celsGK@tzungbi-laptop>
References: <20240727143820.1358225-1-linux@roeck-us.net>
 <20240727143820.1358225-5-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240727143820.1358225-5-linux@roeck-us.net>

On Sat, Jul 27, 2024 at 07:38:18AM -0700, Guenter Roeck wrote:
> Convert driver to with_info hwmon API to simplify the code and
> with it its maintainability.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
