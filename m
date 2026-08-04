Received: from sender-of-o58.zoho.eu (sender-of-o58.zoho.eu [136.143.169.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E28846C4AA;
	Tue,  4 Aug 2026 10:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.169.58
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785838039; cv=pass; b=ED2+AVm/I3PQkObkQqpsfPtO+jy7CTVTmOqCuLJ0VGxDBiFRXqUZ4rwgIl/BBVx++zm2mLQq49BvQ6HvbhnoHzfdl1Pkx57XwO6Ru1qfLJOnBoqlAV9YFiyvaieH53QlLqb+hAsaPCYP8hlL/K/hB47tRWeixTSG0mwCJA2C5PI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785838039; c=relaxed/simple;
	bh=zqqfuD5S0/5z/+0oKI1UspVl0qPF4xMvXMyvA7fV9GU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dEqlBGCw04sjsjXWzCaovRAY5j6jvg69xDdNv/LwHhzrXOqo+pvZ6t3UT5l/vly2TT4QS9fHYnsk7r2V6kOIPCb9S9GRZ/jcqJ9AQUHVt50cmOnvkLmaLGwhLNqswUc0NvzQ9G7Pf0NYLYDauBG/r7RdZn4IE6Lh+XfIOOm/d3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com; spf=pass smtp.mailfrom=iusegentoo.com; dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b=Ik94oOCl; arc=pass smtp.client-ip=136.143.169.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iusegentoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iusegentoo.com header.i=ali@iusegentoo.com header.b="Ik94oOCl"
ARC-Seal: i=1; a=rsa-sha256; t=1785838018; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=iR6hW1TKgQJsg/sOUYS/GambA0XZ6kATxnOqAMxtcUBv9Ns+ozQpxt6gUaUBaw443RnUiY2tVljnqa5MtqWQ6IS7Mb13hae1nOEE3cSJtbbNYf3ukxPRxpAyiGL3d8vRHLK4PqEaj+1X3Ub2hA56eSVuhqgDqE1l7nOjtx1AJac=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1785838018; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zqqfuD5S0/5z/+0oKI1UspVl0qPF4xMvXMyvA7fV9GU=; 
	b=SwpJ+tpNAvnhBii9KV4WXiqZqAL1AnNQv4DbyWnEodk/SfyEda/X5mfLretDZfL3yfVelzH/WTeH6PDacDhtFaEKJrwjy4rUgvSM92l0x7/BAL3YM/eyuwcA9BBXKDNrHlDZkLKeYIrHvMx4wWwwG/CKnOo9+siMRkln0TAjCKQ=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iusegentoo.com;
	spf=pass  smtp.mailfrom=ali@iusegentoo.com;
	dmarc=pass header.from=<ali@iusegentoo.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1785838018;
	s=zmail; d=iusegentoo.com; i=ali@iusegentoo.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zqqfuD5S0/5z/+0oKI1UspVl0qPF4xMvXMyvA7fV9GU=;
	b=Ik94oOCln4pQF3qXLNDS+4mhiWFEptlBOtqpGqXcVeBAvb55m7Zes55lIUSwMMZx
	UEB5wrlqawL6oLiug5lZFWo6jqyUihNMcYDInezjQqjyrt8bzZzQf9Ha4wEk0Dz8H0O
	ssQzKk/LoVh6ZwqMtwvUTPorBLf+jnHoHGcYIWGo=
Received: by mx.zoho.eu with SMTPS id 1785838016161376.4593959656481;
	Tue, 4 Aug 2026 12:06:56 +0200 (CEST)
From: Ali Ahmet Memis <ali@iusegentoo.com>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against hwmon
Date: Tue,  4 Aug 2026 10:06:45 +0000
Message-ID: <20260804100645.233305-1-ali@iusegentoo.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804094753.230500-1-ali@iusegentoo.com>
References: <20260802123653.19532-1-ali@iusegentoo.com> <20260804061110.575adfc2@posteo.net> <20260804094753.230500-1-ali@iusegentoo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

> the next command's reinit_completion() re-arms the guard at the top of
> raw_event, and that stale reply is taken as the answer to the new command

Correcting myself on the mechanism, since it changes what a fix has to do.

reinit_completion() is not what defeats that guard. completion_done() is
just x->done != 0, and x->done is zero in every state between commands: a
successful wait_for_completion_timeout() decrements it back to zero, and a
timeout leaves it at zero because it was never set. So the check at the top
of raw_event practically never rejects anything, and reinit_completion() on
the next command writes zero over a value that is already zero.

The outcome I described is the same, a late reply still lands in cmd_buffer
and completes the next waiter with the previous command's data. But that
check is not a "command in flight" flag and cannot be turned into one by
moving it around, so whatever fixes this needs a way to tell which command a
reply actually belongs to.
