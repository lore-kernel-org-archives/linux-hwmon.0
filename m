Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E533BB66C;
	Fri, 26 Jun 2026 09:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782467809; cv=none; b=LxeS7WnxAdK+zT8DgpyAXsdji+4KSUKUB5EYT2CrKCJVfn82JE3yB7r6qTGlKvzR8jZrBvBLOMixqrc8pIGtX1BGphkZWg8XjsY4gSfbRrNuAxuI87w8tFh04ftOnNob9eNuo1DQpZvhTfP5WiT5RYWjkp2e/13mkJgXdtdaGlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782467809; c=relaxed/simple;
	bh=RE0qhOfkQ7ruenyzlEj7Bxrp/hmm+5LmZjxXe8hCEhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kpMRKAgAM/ylzHvkmQ3f+h7yztj2Me8J71HG3ZqWuFwG48F8Dp9QcpTKCUiFA3oFRXpb9VFk8CJ2yVM75shG9K150obigW/zjsA5V9ar4IlY0PoWCyUgvyFKeOqBS39Al7raReUuL1i+xgtDVuFbe+gnZ7wswo2j2st8pKiZMWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=YTvn0uMW; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="YTvn0uMW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Content-Type:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=PRjTLPlPgo4RP++aNKoyqSFzF5p07vlm/FWH4+ncEtw=; b=YTvn0uMWt750zGg234gGUAVN7X
	LWkp3LeykRqkJumToA5aojtkKJSYnrjisD72fARWxKnZaPAJo6g3mnuO1DveLBo7hiNmf/KK7GYSb
	dj+3REQZHHnhx3RzLlznr8PdcGeYv3Bl0nET1BrUnoFNLUu3Xqz4rQLGfsZXNWrJIMZA4sYF03/AZ
	VuY2wx6XtWua6K/LoSD/iz4eG6xMLIVACguZDf0wU4ram5A739/cZKMcEN7axoOt/6oqgBDNATGwa
	D3pCB318HoLQwcmGabF4HWG4WvIKIxLmD9DuLX4Ujt2CLKI4T7W3C7wJs9yi8kXsRBshtRu/Jd0YP
	IPgzfzjg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wd3Ie-003t3h-3C;
	Fri, 26 Jun 2026 09:56:41 +0000
Date: Fri, 26 Jun 2026 02:56:34 -0700
From: Breno Leitao <leitao@debian.org>
To: linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com, linux-mm@kvack.org
Cc: Breno Leitao <leitao@debian.org>, kerneljasonxing@gmail.com, 
	iipeace5@gmail.com, gavinguo@igalia.com, linux@jordanrome.com, amscanne@meta.com, 
	sj@kernel.org, gpiccoli@igalia.com, Daniel Gomez <da.gomez@kernel.org>, 
	mfo@igalia.com, platform-driver-x86@vger.kernel.org, 
	acpica-devel@lists.linux.dev
Subject: [ANNOUNCEMENT] LPC 2026: System Monitoring and Observability
 Microconference
Message-ID: <aj5KJEIsTl6IK0nX@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Debian-User: leitao

We are pleased to announce the Call for Proposals (CFP) for another
edition of  System Monitoring and Observability Microconference, this
time at the 2026 Linux Plumbers Conference (LPC), taking place in
Prague, Czechia, from Oct 5-7, 2026.

  https://lpc.events/event/20/sessions/262/

This microconference provides a valuable forum for key engineering areas
such as:

   - Kernel Health and Runtime Monitoring
   - Hardware Integration and Error Detection
   - Correlation of Issues (crashes, stalls, bugs)
   - Virtualization Stack Monitoring
   - Memory Management Monitoring and Observability
   - Anomaly Detection Algorithms for System Behavior
   - Automated Analysis, Remediation and post mortem analyzes

The purpose of each talk is to share challenges and discuss potential
improvements. Sessions will last 20 to 30 minutes and aim to encourage
brainstorming and open dialogue about ongoing issues rather than
delivering immediate solutions.

The conference acts as both a knowledge-sharing platform and a strategic
venue for guiding the future of kernel technologies to better meet the
demands of large-scale infrastructure.

We invite you to submit your proposals here:
	https://lpc.events/event/20/abstracts/

Please select track "Linux System Monitoring and Observability MC"
