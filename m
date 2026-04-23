Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93C825A359
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 14:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776955078; cv=none; b=INWSDnVowbR2UF4bMAli9eImM1zZBvjc8cooHG4Hsgi7TLnjPH029jMZ7oBbJekBvYdwdoJ1TA52E8MC0l4C0kuqZ3ZdinwubDDLinIAaZtrwIqKv8RfxZAtxh5pAfBKcDaYJ/vZtn+MsUvUUjvJXFOAXp0LZVAeHQcC30GXUBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776955078; c=relaxed/simple;
	bh=f91/TZMczOMeBugi9AGSMdKDlr3G8CMQswkvxfnMFH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agJk2+M5LuJIejIl30zmlehg+jOf1MxXEqlXZAn+vOzQQfdhXo44DqWChxhU2bYsjahwVRL0bbtkja5W4vsRTRSmkl7TpmobTs0/D5pHgjPpgyDGsKIkg36MSXUw/qTkJrz5DxpeYH3qrzbqscQFj5rNFOLCRDWu73wLbc5OEls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X5RzKleI; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X5RzKleI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776955074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f91/TZMczOMeBugi9AGSMdKDlr3G8CMQswkvxfnMFH8=;
	b=X5RzKleIzVJsfeuNr+bfqOXopy0rSchwtFfXCKtyrBZfK0yaEF7+fYv7fALPdg/Jk2w7UX
	nyvfC8uuCs8InNH3o85UOS1dJxvyiKmfD64ITTphSnlW+BMMoxYKkxWLJalUZGpGLZQM3c
	aEZediGKN1YfAy7kgANb1RsrgOjQR9A=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-Ba1ZSD-IOBSsAfQaosmL7g-1; Thu,
 23 Apr 2026 10:37:47 -0400
X-MC-Unique: Ba1ZSD-IOBSsAfQaosmL7g-1
X-Mimecast-MFC-AGG-ID: Ba1ZSD-IOBSsAfQaosmL7g_1776955064
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2BED819560A2;
	Thu, 23 Apr 2026 14:37:44 +0000 (UTC)
Received: from [10.22.64.201] (unknown [10.22.64.201])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 22F5A196B8F6;
	Thu, 23 Apr 2026 14:37:42 +0000 (UTC)
Message-ID: <dbad8115-2f39-4a03-8eaf-6651d5507a8f@redhat.com>
Date: Thu, 23 Apr 2026 10:37:42 -0400
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/23] sched/core: Use RCU to protect access of
 HK_TYPE_KERNEL_NOISE cpumask
To: sashiko@lists.linux.dev
Cc: mkoutny@suse.com, tj@kernel.org, linux-hwmon@vger.kernel.org,
 hannes@cmpxchg.org
References: <20260421030351.281436-14-longman@redhat.com>
 <20260422030902.4F95FC2BCB0@smtp.kernel.org>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <20260422030902.4F95FC2BCB0@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

DQpPbiA0LzIxLzI2IDExOjA5IFBNLCBzYXNoaWtvLWJvdEBrZXJuZWwub3JnIHdyb3RlOg0K
PiBTYXNoaWtvIEFJIHJldmlldyBmb3VuZCAxIHBvdGVudGlhbCBpc3N1ZShzKToNCj4gLSBb
SGlnaF0gVGhlIGNvbW1pdCBtZXNzYWdlIGluY29ycmVjdGx5IGNsYWltcyB0aGF0IGBob3Vz
ZWtlZXBpbmdfY3B1bWFzaygpYCB3aWxsIHdhcm4gaWYgdXNlZCBpbiBhbiBpbnZhbGlkIGNv
bnRleHQsIG1hc2tpbmcgcG90ZW50aWFsIFJDVSBzYWZldHkgdmlvbGF0aW9ucyBlbHNld2hl
cmUgaW4gdGhlIGtlcm5lbC4gU3BlY2lmaWNhbGx5LCBgaG91c2VrZWVwaW5nX2RlcmVmZXJl
bmNlX2NoZWNrKHR5cGUpYCByZXR1cm5zIGB0cnVlYCBmb3IgYEhLX1RZUEVfS0VSTkVMX05P
SVNFYCwgY2F1c2luZyBgcmN1X2RlcmVmZXJlbmNlX2FsbF9jaGVjaygpYCB0byBieXBhc3Mg
dGhlIGByY3VfcmVhZF9sb2NrX2hlbGQoKWAgdmFsaWRhdGlvbi4gVGhpcyBmYWxzZSBhc3N1
bXB0aW9uIG9mIGEgc2FmZXR5IG5ldCBsZWQgdGhlIGF1dGhvciB0byBtaXNzIHVucHJvdGVj
dGVkIGFjY2Vzc2VzLCBzdWNoIGFzIHRoZSBgaG91c2VrZWVwaW5nX3Nob3dgIHN5c2ZzIGhh
bmRsZXIgaW4gYGRyaXZlcnMvYmFzZS9jcHUuY2Agd2hpY2ggZG9lcyBub3QgaG9sZCBgcmN1
X3JlYWRfbG9jaygpYC4gQmVjYXVzZSBgaG91c2VrZWVwaW5nX3VwZGF0ZSgpYCByZXBsYWNl
cyBhbmQgZnJlZXMgdGhlIG9sZCBtYXNrIHZpYSBga2ZyZWUoKWAgYWZ0ZXIgYHN5bmNocm9u
aXplX3JjdSgpYCwgY29uY3VycmVudCBleGVjdXRpb24gb2YgYGhvdXNla2VlcGluZ19zaG93
KClgIHJlc3VsdHMgaW4gYSBVc2UtQWZ0ZXItRnJlZS4gV2hpbGUgdGhlIGxvY2tkZXAgb21p
c3Npb24gaXMgcGF0Y2hlZCBsYXRlciBpbiB0aGUgc2VyaWVzIGJ5IGNvbW1pdCAic2NoZWQv
aXNvbGF0aW9uOiBFeHRlbmQgaG91c2VrZWVwaW5nX2RlcmVmZXJlbmNlX2NoZWNrKCkgdG8g
Y292ZXIgY2hhbmdlcyBpbiBub2h6X2Z1bGwgb3IgbWFuZ2VkX2lycXMgY3B1bWFza3MiLCB0
aGUgdW5kZXJseWluZyBVc2UtQWZ0ZXItRnJlZSB2dWxuZXJhYmlsaXR5IGluIGBkcml2ZXJz
L2Jhc2UvY3B1LmNgIHJlbWFpbnMgdW5maXhlZCB0aHJvdWdob3V0IHRoZSBlbnRpcmUgc2Vy
aWVzLg0KPiAtLQ0KPg0KPiBjb21taXQgN2E3NzRiMzZmOWQ5YjQzMGJmNzE3MTUzNGI1M2Y2
MTQ1NTU2ZjQ4Mw0KPiBBdXRob3I6IFdhaW1hbiBMb25nIDxsb25nbWFuQHJlZGhhdC5jb20+
DQo+DQo+IHNjaGVkL2NvcmU6IFVzZSBSQ1UgdG8gcHJvdGVjdCBhY2Nlc3Mgb2YgSEtfVFlQ
RV9LRVJORUxfTk9JU0UgY3B1bWFzaw0KPg0KPiBUaGlzIGNvbW1pdCBhZGRzIFJDVSBwcm90
ZWN0aW9uIHRvIHRoZSBIS19UWVBFX0tFUk5FTF9OT0lTRSBjcHVtYXNrIGluDQo+IGdldF9u
b2h6X3RpbWVyX3RhcmdldCgpLCBhcyB0aGUgbWFzayBjYW4gbm93IGJlIGNoYW5nZWQgYXQg
cnVudGltZS4gSXQNCj4gYWxzbyBub3RlcyB0aGF0IGhvdXNla2VlcGluZ19jcHVtYXNrKCkg
d2lsbCB3YXJuIGlmIHVzZWQgaW4gYW4gaW52YWxpZA0KPiBjb250ZXh0Lg0KPg0KPj4gQXMg
SEtfVFlQRV9LRVJORUxfTk9JU0UgaXMgZ29pbmcgdG8gYmUgY2hhbmdlYWJsZSBhdCBydW4g
dGltZSwgdXNlDQo+PiBSQ1UgdG8gcHJvdGVjdCBhY2Nlc3MgdG8gdGhlIGNwdW1hc2sgd2hl
biBuZWVkZWQuIFNvbWUgYWNjZXNzIG9mIHRoZQ0KPj4gSEtfVFlQRV9LRVJORUxfTk9JU0Ug
Y3B1bWFzayBpcyBkb25lIGluc2lkZSB0aGUgdGljayBjb2RlIHRoYXQgaGFzDQo+PiBpbnRl
cnJ1cHQgZGlzYWJsZWQgd2hpY2ggaXMgYSByY3VfcmVhZF9sb2NrKCkgY3JpdGljYWwgc2Vj
dGlvbi4gQW55d2F5LA0KPj4gaG91c2VrZWVwaW5nX2NwdW1hc2soKSB3aWxsIHdhcm4gaWYg
dGhleSBhcmUgdXNlZCBpbiBpbnZhbGlkIGNvbnRleHQuDQo+IElzIHRoaXMgZGVzY3JpcHRp
b24gYWNjdXJhdGU/IExvb2tpbmcgYXQgaG91c2VrZWVwaW5nX2RlcmVmZXJlbmNlX2NoZWNr
KCksDQo+IGl0IHJldHVybnMgdHJ1ZSBmb3IgSEtfVFlQRV9LRVJORUxfTk9JU0UsIHdoaWNo
IGNhdXNlcw0KPiByY3VfZGVyZWZlcmVuY2VfYWxsX2NoZWNrKCkgdG8gYnlwYXNzIHRoZSBy
Y3VfcmVhZF9sb2NrX2hlbGQoKSB2YWxpZGF0aW9uLg0KPiBUaGlzIG1lYW5zIGxvY2tkZXAg
d2lsbCBub3Qgd2FybiBhYm91dCBtaXNzaW5nIFJDVSByZWFkIGxvY2tzIGZvciB0aGlzDQo+
IHNwZWNpZmljIG1hc2suDQoNClRoZSBjaGFuZ2UgdG8gZW5hYmxlIHByb3BlciBsb2NrIHBy
b3RlY3Rpb24gY2hlY2tpbmcgZm9yIA0KSEtfVFlQRV9LRVJORUxfTk9JU0UgaXMgbWFkZSBp
biBhIGxhdGVyIHBhdGNoIGFmdGVyIGFsbCB0aGUgUkNVIGd1YXJkcyANCmFyZSBwcm9wZXJs
eSBhZGRlZC4NCg0KPg0KPiBCZWNhdXNlIHRoZSBtYXNrIGNhbiBub3cgYmUgcmVwbGFjZWQg
YW5kIGZyZWVkIGR5bmFtaWNhbGx5IGFmdGVyDQo+IHN5bmNocm9uaXplX3JjdSgpLCBkb2Vz
IHRoaXMgaW50cm9kdWNlIGEgdXNlLWFmdGVyLWZyZWUgaW4gb3RoZXIgcmVhZGVycw0KPiB0
aGF0IGRvbid0IGhvbGQgdGhlIFJDVSByZWFkIGxvY2s/DQo+DQo+IEZvciBleGFtcGxlLCBo
b3VzZWtlZXBpbmdfc2hvdygpIGluIGRyaXZlcnMvYmFzZS9jcHUuYyByZWFkcyB0aGlzIG1h
c2sgdG8NCj4gcHJpbnQgaXQgdG8gc3lzZnM6DQo+DQo+IGRyaXZlcnMvYmFzZS9jcHUuYzpo
b3VzZWtlZXBpbmdfc2hvdygpIHsNCj4gICAgICAuLi4NCj4gICAgICByZXR1cm4gc3lzZnNf
ZW1pdChidWYsICIlKnBibFxuIiwNCj4gICAgICAgICAgICAgICAgICAgICAgICBjcHVtYXNr
X3ByX2FyZ3MoaG91c2VrZWVwaW5nX2NwdW1hc2sodHlwZSkpKTsNCj4gfQ0KPg0KPiBTaW5j
ZSBob3VzZWtlZXBpbmdfc2hvdygpIGRvZXNuJ3QgaG9sZCByY3VfcmVhZF9sb2NrKCksIGNv
dWxkIGEgY29uY3VycmVudA0KPiB1cGRhdGUgb2YgdGhlIGNwdW1hc2sgY2F1c2UgY3B1bWFz
a19wcl9hcmdzKCkgdG8gYWNjZXNzIGZyZWVkIG1lbW9yeT8NCj4NCj4gV2hpbGUgdGhlIGxv
Y2tkZXAgb21pc3Npb24gaXMgcGF0Y2hlZCBsYXRlciBpbiB0aGlzIHNlcmllcyBieSB0aGUg
Y29tbWl0DQo+ICJzY2hlZC9pc29sYXRpb246IEV4dGVuZCBob3VzZWtlZXBpbmdfZGVyZWZl
cmVuY2VfY2hlY2soKSB0byBjb3ZlciBjaGFuZ2VzDQo+IGluIG5vaHpfZnVsbCBvciBtYW5n
ZWRfaXJxcyBjcHVtYXNrcyIsIHRoZSB1bmRlcmx5aW5nIHVzZS1hZnRlci1mcmVlDQo+IHJl
Z3Jlc3Npb24gaW4gZHJpdmVycy9iYXNlL2NwdS5jIGFwcGVhcnMgdG8gcmVtYWluIHVuZml4
ZWQgdGhyb3VnaG91dCB0aGUNCj4gc2VyaWVzLg0KPg0KVGhhdCBpcyBtaXNzZWQgaW4gdGhl
IGN1cnJlbnQgc2VyaWVzLiBXaWxsIGZpeCB0aGF0IGluIHRoZSBuZXh0IHZlcnNpb24uDQoN
CkNoZWVycywNCkxvbmdtYW4NCg0K

