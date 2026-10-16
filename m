Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12AD640F724;
	Fri, 16 Oct 2026 08:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.163.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140175; cv=none; b=MdLHYQi7OTw4K4Ho8NCcjHy4QHrBFllZFWfGfP4Iclz6elBBm9QViubwuiiDCQ8Hawjh0T3eUouleRxchzLAVYGxxPm2ap8Tt6Eh4AGiFB8mSSwOv1HkQIHqHWbHnXSfxL6e8Q5ZmXYwIMrQf3rdOsLVj913RmhpcJtKu3p9gZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140175; c=relaxed/simple;
	bh=3rbOJU1iFVVApKsSPtz/G7fuEZPLRtV/KP/+IGlxAIs=;
	h=Message-ID:From:To:Cc:Subject:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=m06kyny+OU1ypDnZIEPtINAmGBJN22MEk/CsoF2sAvtjjmoXLvt+rT0psHmuAfRf27lGcX39eZUl5bTzK38KCzuIAfGsygu3Poq2/3gbkhXYk+rWVi/8xjWHlS0Ao3W7mJL/W+6sMnD0TjV2kI8PQCwP0/RfyqAPHnAjgY0pj/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=faR1OGUI; arc=none smtp.client-ip=43.163.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="faR1OGUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1792140168; bh=3rbOJU1iFVVApKsSPtz/G7fuEZPLRtV/KP/+IGlxAIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=faR1OGUIEXqyudze+/rlXhjJOm9SouE9CAzMUCOfVVYQfrJ+HeCID4Ymx2wwJwuyc
	 o+k4gXNkD08P9h2gFOLZ2SganIhqtwrA2DOTo+tKQhk8ucGH5IwNPlT4/Ej1lxb8ea
	 K9W94jSj+Rq/18omhjCcXJYfPqXq/pqfWiSn+THg=
Received: from [172.24.48.1] ([2409:8951:a22:b25:d1a1:62d3:eb69:e679])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id AAD22012; Fri, 16 Oct 2026 16:42:45 +0800
X-QQ-mid: xmsmtpt1792140165tdx1v56y9
Message-ID: <tencent_4F803EA6BD452898DAAF75EE74A20EF07F05@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJfwZITd6fr7SnRvjrd9me4hJGfU0DLueOQ9LmSLDg7GZv8O25uU
	 XfbwJ2nYms+kEoWJEgpBC9XaxzNW5canrgt4aJ4hXBJP0ZJL6iHW9xRb/PPg29Ng+8U6luqTb9Py
	 kTE8+OOly1DlVzfrojmzjkYOk7TtukcP3XjkRXf8ScxLQkUFG2miyWQY5/ZgH6/CL6ki9JAy7qSi
	 Y5NOsw0l3U/xICoQACUfnwLTyCLUXIBZrJqBaNtOPBzdUWqQKq9M6+AhzAa2LqWJ6s42zM538EUh
	 62S08zXFLmYD+nmf3/73MVoQRwEVMNnhB3UWfdEP5FV8viFrRBj/rSEkD+bAG3MsXKphOofgTE8J
	 zOqR8auNeNNyTAKXjT+ueUstpd3V1/ctOJMhAWBGlUi9bQdf9cigac+8ZwSzdQdNssqr8Dyapgrm
	 xLCtFGivbqKOfs+3PrAdeaXYpG89FxJCartwGYh0AWbQDZzNhb4vIYV2HPn8ba4jwATNoJRxFiFr
	 w2yGM8vOiunNwgIdGX3SVZKvUCCcDOTEQvRdvbIfBWwLLQA9FOcVIWVEXAg6nsrABxsHpoZxzfY6
	 Jc4j5hBAEVpmqO7d5WyPO6e3nfvK1z/9XnJuigM4HBrAO6uXf7iKCCl8DqUQChGWof1L9P2n0Ioz
	 fBQvGkse4Js+MXPpuyvE1OnyPpht3lK/G5dnmb4XANqiZOfnfVOFYgApj7L5+BjLE7l61uv3S/NU
	 I+1uxs0MPvGFaci0KF5XnJi96WxrwX+bHnVA2qOd7cVD2ErVXKyGDLeJ9VNXCZD65u0IsPebvHKI
	 uoeAZle2eSi+tyTOwxAVeLtEiHXByHej68h1dOBit1xLrCvbRn2NHLJ7xJ9WoveSgP6NV31ldZp4
	 RDtqDUgDBZ0nMXw/JbcKduNRmTMzAomEgpsQfsuMi6uIh0YxHQl33+WRVOUlCKTFZBUbXkfoQxwo
	 iflH+sv/7qsRinDjWfRcTVMiBTjQ17M1zaKjlqvq/0jdY1iUZ15X+rOaIEjCuxp/sRaRYr9jRO0X
	 w6NmviBKi+rItApyjqgSznb+ot8xY=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: skxby <2374604267@qq.com>
To: Donjuanplatinum <donplat@barrensea.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Subject:
 Re: [PATCH 0/2] rust: hwmon: rework hwmon abstractions, add TMP108 driver
Date: Fri, 16 Oct 2026 16:42:45 +0800
X-OQ-MSGID: <179214016501.15268.642738678844764524@qq.com>
In-Reply-To: <87se26dpzf.fsf@barrensea.org>
References: <20260512155747.10136-1-donplat@barrensea.org>
 <9c2fa543-525a-4e43-9f73-7caf13b98039@roeck-us.net>
 <tencent_576573331343805F032731492D63C12D7E08@qq.com>
 <87se26dpzf.fsf@barrensea.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Donjuanplatinum,

Thank you for taking the time to look at this - and for replying at all.
Let me answer each point.

1. AI involvement

Fair question, and I should have stated it up front. The work was
developed with AI assistance: I run a multi-agent setup (a scheduler
plus several model-backed agents) that produced code drafts, ran the
build/regression/stress-test cycles and drafted the commit messages and
cover letter. Every patch was reviewed by me, and I built and tested
each change myself; the two bugs we found during this round (an i2c
client leak on the registration error path, and a missing null
terminator in chip_config) were both found by the lifecycle stress tests
I ran and reproduced before fixing. I signed off on the series and I
take responsibility for it.

For v2 I will add an "Assisted-by: LLM" tag as described in
Documentation/process/coding-assistants.html. Please tell me if you want
the tool names listed there as well.

2. Cc Rust-for-Linux

Agreed - I did not Cc rust-for-linux on v1, and I should have. v2 will
Cc rust-for-linux@vger.kernel.org.

3. "?"

I am not sure what this referred to - could you say a little more about
what you were questioning there? I would rather ask than guess.

4. Legal name in sign-off

You are right that "skxby <2374604267@qq.com>" is not a legal name.
The series will be re-signed with my real name and address in v2.

5. Maintainership and interest

I am not asking anyone to take this over, and I am not claiming
maintainership. The point of posting was to have the shape of the
abstraction and one real driver on top of it looked at, and to find out
whether that shape is the right one at all - which your reply and the
review have already started to do.

On that note: Sashiko's review of patch 1 found issues that are real,
and I agree with the ones I have checked so far. In particular it
flagged the missing null terminator in chip_config - which we had
already found and fixed ourselves through stress testing, and which is a
good sign the review is looking at the right things - and it flagged
that chip_read/chip_write are called unconditionally in the read/write
callbacks, which would break any driver that does not implement those
optional methods. That second one is a genuine design flaw in the
abstraction, not in the driver, and I am fixing it in v2 along with the
name lifetime issue and the locking documentation.

So: is there enough interest to keep going? That is exactly what I am
trying to establish too, and your answer - either way - is the most
useful input available. If the answer is "not yet", I would rather hear
it now than keep posting revisions.

Thanks again for looking.

<SENDER REAL NAME>

