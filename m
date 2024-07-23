Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30549134B6
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jul 2024 05:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721713014; cv=none; b=DFJJ6CD29zdqJYNL8BkAA12qydIYeho/b0VxbM+msspf/WYULi4H/6nojMtPx8lHllIgOxGm3AF6HJHs7Ub5e/EqzB9IKlTgnoTAtFZx2Aj8aZVrd4YvIFR1OX4csZJLmCWRelFWRGWA7rGGdvxlbwFTOOLVqNpMPQC0/qx+C58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721713014; c=relaxed/simple;
	bh=qerCDVnNBET3/WwTubunay80VFv9DbLJiGEjhkerfuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mAt4nXuoQhZcZ+Z3oCeS9geRFvJvLjOtevmcJjeGbQmdyUnlgXOSYOgCu8UV2BAk8T8bpRXUm7nmatIn4OrREeBsnGY7NfhLOS/D/yP4jHDq76MB7LCK4P7DQXNNSP6UPRMP4R5Ksg9XMQVKnzx0HM1G2G0a8ZbNfDzV9ve39tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IINyExh7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IINyExh7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31639C4AF0B;
	Tue, 23 Jul 2024 05:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721713013;
	bh=qerCDVnNBET3/WwTubunay80VFv9DbLJiGEjhkerfuQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IINyExh7EUW6tHS+FlgQ+JBaOuWwbINQNXhoT3tXyj97Hs/Qa3fsPnznfv8wEY7FP
	 HSYijxSQ1fvfBiuEr2+cWQSL24nII1kL05c0PCPf+OJEcwn/C9mqqZBttCEB9a70KZ
	 okKtUsAHXXGk82XcH0rJclHR4WfXLhR6ylwmtKTmtyEjnVd5cqFZpbeKfbYVbsz55r
	 M1EYhswLNTDCnMnoVzX8PBiOaq+7FQa5Cr/XfCDlIjYb+LZ89iQ53qnX95CxQMUDjC
	 ZGeq/W4FGzqiuGn11ruWjUwSDMvqf3sx/a/qpxlxWQI3MvXKbQyKfjBVmilFe4BsjK
	 f23eTh/hAbrHw==
Date: Tue, 23 Jul 2024 05:36:51 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/6] hwmon: (max6697) Reorder include files
Message-ID: <Zp9Bc-2YOFnfheIi@google.com>
References: <20240723005204.1356501-1-linux@roeck-us.net>
 <20240723005204.1356501-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240723005204.1356501-2-linux@roeck-us.net>

On Mon, Jul 22, 2024 at 05:51:59PM -0700, Guenter Roeck wrote:
> +#include <linux/init.h>
> +#include <linux/jiffies.h>
> +#include <linux/i2c.h>

#include <linux/i2c.h>
#include <linux/init.h>
#include <linux/jiffies.h>
