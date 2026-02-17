Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010031.outbound.protection.outlook.com [40.93.198.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F74D2D5C6C;
	Tue, 17 Feb 2026 10:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771323013; cv=fail; b=nYDfkhfuUlzIakKEc2jGQIRgXISNnQpt98AdY1fKPt7u/3SgYPwxFgBcS6vRstwZmEFw4adNDW4XoVFVT+bQIapHxNZBvoR8QpQ0NMWBr4Cqt6nYi17n4m++wUFShjvme3BV2VCg2ll8rrni7V9fycmGLmxXk3IQlnn0+RBzG0E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771323013; c=relaxed/simple;
	bh=KJgZmEDNBH2p35zGYPxo5HNLu5z2nwVT75BP4rnr18M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLxHpT3G60d7L/d04KTU8kqxZE+wqvRfF7ObytCt5NeDM0+6FjsVbF0JAwJiiynTAnZgRsmAfhehAz9GWCDHBu5jEHNa2Zh4Kie825zb67fD5FFAUlxfANAKEx2hD3aU0+IaUp+jI6WKiLBYtWwypFVy3LZNLt14Chwolj2wZzc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com; spf=pass smtp.mailfrom=gehealthcare.com; dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b=em6jUaPK; arc=fail smtp.client-ip=40.93.198.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gehealthcare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gehealthcare.com header.i=@gehealthcare.com header.b="em6jUaPK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z2/frvM4SBzDUFf7nvStcV4JaBUkhAoTotw69ywi7VTbGHp50ty2EnH5QcT/7jPGjhyJtOBXpRbCuZfcFKzaineThr3bSpuZYyCp03KIa/jSjx5xFhZUw1EaMHIsri1kV0rBRqjVpwkm8Tv2/SmCdFelWEGSKDJk+tKeBddxACHVmnVvUWvHzGr15jTJRL6BmlRi+ypvVbNuexbsIyPiWvmrv2DuuD4bx3ogirmxdzXWdOpH7P4DENCy30TxnWDJxjJF7/5vRLg7EXmFTl1GyV+HDhgJRVQDzl4L2T5ykjJh8Q5IAXYivEu1hHZNDqkvcx7CQK7QFgC0BKrrEyu+iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JkbAKj6uQSxIzwdO33/U1MbuYmo8otVsMc1RTwLroD4=;
 b=BxwXMgyBGdeE+yAeIITTOjhmX0YsOW5dzT/gg4cvbmokAVTwTw8T//FOM4MGSmtO23DJKAB77UGKM/14lPGHvIzQIFSnExxGjAhO+DXQD0po79LCdfNDt/pUUSTll3xHWbbbzAAKzxylB61HwQVpPcGy4bTp3A5erlgIWnJ8ar83JjyPpb1QA0bI4gvev+vYJb1ZMF8wgi1sabguy6+pmEWUsmaNwIlTKd1RR7CHYkrsAzwXk2U+gylUXu+8BlOmX5Mx1rgh/UUUeH7xxEAKPeVIwELqJ/BnVPbuflgbi4FS8Ug9AYUOp8MbHAg22EfLjfO/ahyD1TZkPlLJt438cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 165.85.157.49) smtp.rcpttodomain=vger.kernel.org
 smtp.mailfrom=gehealthcare.com; dmarc=fail (p=quarantine sp=quarantine
 pct=100) action=quarantine header.from=gehealthcare.com; dkim=none (message
 not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gehealthcare.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JkbAKj6uQSxIzwdO33/U1MbuYmo8otVsMc1RTwLroD4=;
 b=em6jUaPKJbLYYqwdZ4n//b+X6Pya8APJMJBUwWHxXqPj9EXSzYp8C+Dl6HjGjO/CkkGkqxOpYlYhfOkLVdJpNscinbyGmJGG95BqHeUts+PBesMCZil0srSzTLgn3PKWjiI07TUP2gyXpEWUQUE35Wi+WVkdHrVT9I4tKWeyYygfPJSm5nQfHJytC5gNx602dS7+DZPd3i0by0dPJGS/HGtTXT1wZuCwY26UWeUgJNaRbb+M5G/wFIJGuzszSw0UIntjCJmEQjOHwobD2l2O6oazVNMEogi8HxccbGDyCY2Vjoybm7JFEV8GFtj1C3w+JkAMNqBu1sZ94ThM0fysEA==
Received: from SJ0PR13CA0018.namprd13.prod.outlook.com (2603:10b6:a03:2c0::23)
 by DM3PPF4E0899F31.namprd22.prod.outlook.com (2603:10b6:f:fc00::e1e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 17 Feb
 2026 10:10:09 +0000
Received: from SJ5PEPF000001EC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c0:cafe::1) by SJ0PR13CA0018.outlook.office365.com
 (2603:10b6:a03:2c0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Tue,
 17 Feb 2026 10:10:02 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 165.85.157.49)
 smtp.mailfrom=gehealthcare.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=gehealthcare.com;
Received-SPF: Fail (protection.outlook.com: domain of gehealthcare.com does
 not designate 165.85.157.49 as permitted sender)
 receiver=protection.outlook.com; client-ip=165.85.157.49;
 helo=mkerelay2.compute.ge-healthcare.net;
Received: from mkerelay2.compute.ge-healthcare.net (165.85.157.49) by
 SJ5PEPF000001EC.mail.protection.outlook.com (10.167.242.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 17 Feb 2026 10:10:08 +0000
Received: from zeus (zoo13.fihel.lab.ge-healthcare.net [10.168.174.111])
	by builder1.fihel.lab.ge-healthcare.net (Postfix) with ESMTP id 9DEF7E8F41;
	Tue, 17 Feb 2026 12:10:05 +0200 (EET)
Date: Tue, 17 Feb 2026 12:10:05 +0200
From: Ian Ray <ian.ray@gehealthcare.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: ti,ina2xx: Add INA234 device
Message-ID: <aZQ-fWR8_ISD4Y8U@zeus>
References: <20260217092325.15867-1-ian.ray@gehealthcare.com>
 <8e23ba87-b6c9-4ad8-97ed-3e203a81121b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8e23ba87-b6c9-4ad8-97ed-3e203a81121b@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EC:EE_|DM3PPF4E0899F31:EE_
X-MS-Office365-Filtering-Correlation-Id: 59eaafe7-81da-443e-f911-08de6e0cbadf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUZjdkJTZnNsSWNkb0djVG94cGVKYjlaWXZjMDRUV3A4dUVVQ2Nia2YxeW9I?=
 =?utf-8?B?M0U4N3JGMS9PYTh3S0dUN3Z2NDBTWi9MTE90TEVMcTRKNGIxMjRqZStpaW1i?=
 =?utf-8?B?bytMYW4rYXJYR3k4bzdYUzFkOG5CQnJzcEI4N2VSdzk3K2poenlWTWRPQk5U?=
 =?utf-8?B?TVVlSFcraTA2clJDeWdUaHJ6STA4WVk3dUg5ZWFuRnFaNDVMaGN6cnRYZWJ6?=
 =?utf-8?B?UHkrbHoyTDJEd2pQZmRTbjdKaTQ1ZW83dlFIRkhjVFd3YjE2SXZjTitYZVNU?=
 =?utf-8?B?amR5aGFOUTBtTHk4bjVwZ1liUGY3S1hDVDFGODgzdGhnTzZMY3c5OFYwY0h0?=
 =?utf-8?B?bURMS0lHQldGZzVXOVpSeS9pUExrZW1VMUlKd3J0cC9MRm9ybVB6cmRMQlJR?=
 =?utf-8?B?anBJanhOeE90QXZXTENwTUFGWkZLOUIySDRmUDhDYzF2cElGRjdqYTdzYzln?=
 =?utf-8?B?ZVQ3c05kdGNWQ01oUW9VV0x4bDNzby9XSHFkRHQrNG9GMXNMNFE0UlpaUGZD?=
 =?utf-8?B?S1pzLzMyb0RCQUhyaUxVa0lYWXp6KzVEOU9CeXJlMkZvbzlLdmcwc0xuZnh4?=
 =?utf-8?B?Vng2YTJTL3J4VythL0NTcThqTVZqMDRhcGNjaEtrb08rTFh0V3RRZzJkS0VH?=
 =?utf-8?B?NUZpVm5zWWROM01VbGpnS0pGeGtEQ2tHOC9aTUx5dVN2eTdNUkVCeXNEVXZy?=
 =?utf-8?B?b1h3Ymk5NWhlVXpnZ2pWWkp2ZGFLSE1KcHR2RmFLSnVvNkRCdnR5L3JwM0xW?=
 =?utf-8?B?dFNIUkt6Sll1UkN6WlpkSFd5NFZaTWJ3c1RzQUVNNmdJbUJJVWZYcHVLUGxm?=
 =?utf-8?B?a3ZUekJXb3JWWWhXQ3hSMTl5QnNVYWdWaTNXVXQ3LyszQkNkMTk1QnF0YXhG?=
 =?utf-8?B?djNlaHF6NWdFemptdFFCNzNyMDVFbUZOamhpN1Z5RE1rWkhOcHRHN2tTVU5t?=
 =?utf-8?B?aUxpZXJoNFZaTE93UmdFS1hPMWVNYjhtaS90THpWSTFnRmE2WTNTRm5DY2V0?=
 =?utf-8?B?L1RqYzVHS3FoQUZxOCtKWm8zR29rb0RLbGlwUXV0YVRVVzhlVng3SEFxRU9w?=
 =?utf-8?B?WC9uSEtaSG5OSXBmMnJtdmlwN3l3N0tlWlNiV04yZHA2ZUplbzlBTDdqakVt?=
 =?utf-8?B?MGZhTUkrRU1QTTdrdERMS3JFa3U1NitJZVdWZzUyUFdOcWR0SWMrbFMxUzN2?=
 =?utf-8?B?U2IwS2ZvOVlabkhNQTNmNFpXSGNYcndEWW0zVTN0RnlMZUUwaGE3QmJnejc2?=
 =?utf-8?B?ait6N2QvK0JSYVY3ODZmZkRhMzdwdnpyRElYQlljQnBRcFJzNUpRUDkweVQv?=
 =?utf-8?B?bStadjZOSWk1a3FWUmZscEp3YlZEbWE4NVJwd2V0ck5PTWtQbXV2SEdFcFNv?=
 =?utf-8?B?MUNycjhxSzcxUWJjVjQ1YkY2eWZRZFJuNS9icjZKZWZWSnlEaURlcG1pK1lP?=
 =?utf-8?B?ZkhhUXdlVHZaNTl2OWZMWW1GREV0UzZqckpoM0Znb0FRU2tJcVFNYzYyeU40?=
 =?utf-8?B?VFpuRS94Um1rT1ZWayszV2hQcXpSOEYwUmhyeVZ3V1o0VkFpKzFwZG9rVGVt?=
 =?utf-8?B?dHAyc1puN1kvdWlRaGVHNGN4RDF4NGE0OFhYMjBsZmF0MCtOU05MaXZ1YU5P?=
 =?utf-8?B?RXI0WFJncUtvWW1lOXlxdVc3d2Y0cVE3VFl2V1VGNjlBT1o2aG1hNmlDN2tq?=
 =?utf-8?B?bXUvL1pGbXJuQ1dDdlhtQVBrMVVkZnk0cUM0WTJSeHk0WlUxaEt0NlFtN1Fl?=
 =?utf-8?B?MWN3clNDMm5menN5VU5IMWJPZlBXalpaNHZRWWJjNC9FK3h5U0lic3ZDMm5B?=
 =?utf-8?B?YUt3NWVyczZ1TEoxelRoNjViRU9aZCt0ZjNYVStYZlBVRkFyamFhejBmZUYw?=
 =?utf-8?B?Vno1cHlnSTRQeW5wVjdvMzdZUHNOR0FIL0lSYVZTTDdJU0lYWHhTUklxbG55?=
 =?utf-8?B?UVVUZkVIcjdmSnlCTHViK0pnUGhaMFhlS0dtZmVuTmw5ZDFqdDV1dk5zRjRX?=
 =?utf-8?B?dzV3eWhUMndGNkN5WU03dlhMZzdnc3hXRTV1S2tmcnlzRFpCcUV2ZTFsZ0Nw?=
 =?utf-8?B?SHMyYWtodXVPNXhpK2c4NHRLY3hOSkUrV0hMSkFkK2RCZDRVc2tacVIrT01h?=
 =?utf-8?B?KzJISk8yREo0ZEdBWC9hUEhrL0I2N0R1MkN3bGVOOTRtandRcDJJSWVudUtW?=
 =?utf-8?B?TmZTU1BrODFPTE9reVM4VHFMa1NYVUZLdzBwNDZRa0hDdU8yZWNhTUtKMVIv?=
 =?utf-8?B?TlhNZWlGeUw1RVZiM2JiQkNYblJRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.85.157.49;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mkerelay2.compute.ge-healthcare.net;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Bmfr2/cTxB4COPP2rLITQwUdReWuD2VAJnhytOCc0zzapVH4/oKcLRyVtO5mpnrHuDgEgQ0MPwfVJw0NimvFDMr/nc37VZnW/vRd5vRP39cU2zG7HCHo2jna3TtiVFxw4V99gqd1sy/u1W3WiMa10OcjF4a4sR7dOvE/KLs98k7La1ttCmLKZ4sKT7L7sV+EyadhN+znhE6Aq4rsgtp7tBzhyCyoIbuVzN6lX6STl+xhJFZYVBwSfW85IX6Pv8uzznOMm8NH9nVBHv9ZXG3EaExio7bw1nvBt3oCtkFOLL7QBxaoKztFsgXjEGqUfu74IBRz04O1WLgDkDrx6ZSLdOzPuP0Jcz/EwOEVZdbtBwyLD3Vt7rhrcVGGSgNBHd1GzHUoAfcz25Y7NaCdqhSZKSGuPGnhr/AM9EaX6GKghg7E+h/LeQxV+DDS7zPmcIjG
X-OriginatorOrg: gehealthcare.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 10:10:08.3384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59eaafe7-81da-443e-f911-08de6e0cbadf
X-MS-Exchange-CrossTenant-Id: 9a309606-d6ec-4188-a28a-298812b4bbbf
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=9a309606-d6ec-4188-a28a-298812b4bbbf;Ip=[165.85.157.49];Helo=[mkerelay2.compute.ge-healthcare.net]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF000001EC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF4E0899F31

On Tue, Feb 17, 2026 at 11:05:47AM +0100, Krzysztof Kozlowski wrote:
> CAUTION: This email originated from outside of GE HealthCare. Only open links or attachments if you trust the sender. Report suspicious emails using Outlook’s “Report” button.
> 
> On 17/02/2026 10:23, Ian Ray wrote:
> > Add a compatible string for the INA234 device, which is like INA226 but
> > has different scaling.
> >
> > Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>
> > ---
> >  Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml | 3 +++
> 
> I got 1/2 but no cover letter, no 2/2 and no explanation in the
> changelog of that. Usually I use driver code to avoid you questions
> about compatibility, but since you decided not to send it to me, then
> you have question:

Sincere apologies, I used scripts/get_maintainer.pl with git-send-email
and failed to notice that you were not cc'd.

Patch [2/2] is here:
https://lore.kernel.org/all/20260217092325.15867-2-ian.ray@gehealthcare.com/

> 
> Does "different scaling" mean devices are not compatible in terms of DT
> compatibility (subset/superset)?

That's correct, the device tree compatible must be different since the
driver uses the compatible to configure the scaling.

> 
> Best regards,
> Krzysztof
