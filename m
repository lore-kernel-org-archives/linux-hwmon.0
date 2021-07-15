Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7694FC636C8
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Jul 2021 18:29:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D123613BB
	for <linux-hwmon@archiver.kernel.org>; Thu, 15 Jul 2021 18:29:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229556AbhGOScv (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 15 Jul 2021 14:32:51 -0400
Received: from mga05.intel.com ([192.55.52.43]:47045 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229506AbhGOScu (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Jul 2021 14:32:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="296248668"
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; 
   d="scan'208";a="296248668"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 11:29:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,243,1620716400"; 
   d="scan'208";a="413725599"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by orsmga003.jf.intel.com with ESMTP; 15 Jul 2021 11:29:47 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 15 Jul 2021 11:29:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 15 Jul 2021 11:29:46 -0700
Received: from fmsmsx610.amr.corp.intel.com ([10.18.126.90]) by
 fmsmsx610.amr.corp.intel.com ([10.18.126.90]) with mapi id 15.01.2242.010;
 Thu, 15 Jul 2021 11:29:46 -0700
From:   "Luck, Tony" <tony.luck@intel.com>
To:     "Williams, Dan J" <dan.j.williams@intel.com>,
        "Winiarska, Iwona" <iwona.winiarska@intel.com>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "jae.hyun.yoo@linux.intel.com" <jae.hyun.yoo@linux.intel.com>,
        "Lutomirski, Andy" <luto@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "andrew@aj.id.au" <andrew@aj.id.au>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "bp@alien8.de" <bp@alien8.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "yazen.ghannam@amd.com" <yazen.ghannam@amd.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "joel@jms.id.au" <joel@jms.id.au>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>,
        "pierre-louis.bossart@linux.intel.com" 
        <pierre-louis.bossart@linux.intel.com>
Subject: RE: [PATCH 01/14] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Topic: [PATCH 01/14] x86/cpu: Move intel-family to arch-independent
 headers
Thread-Index: AQHXd2pbzZadhIqqdEqWEklQPBy5PKtDKGuAgAGQOwCAABg7gP//jU5Q
Date:   Thu, 15 Jul 2021 18:29:46 +0000
Message-ID: <475c3f70da104d4bac6a902cc41e48d8@intel.com>
References: <20210712220447.957418-1-iwona.winiarska@intel.com>
 <20210712220447.957418-2-iwona.winiarska@intel.com>
 <32c71687f11fb418dafa45ecf15f7c6b50dd0397.camel@intel.com>
 <218ef97a68491e88d8012799385ee244544a157a.camel@intel.com>
 <CAPcyv4hxsjKjLkEgGuG6tHvYxUa69315OvhYRORvCtXv6vu2nw@mail.gmail.com>
In-Reply-To: <CAPcyv4hxsjKjLkEgGuG6tHvYxUa69315OvhYRORvCtXv6vu2nw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

PiBIYXZpbmcgMiBwb3RlbnRpYWwgcGxhY2VzIGZvciB0aGUgc2FtZSBkZWZpbml0aW9uIGNhdXNl
cyBhIHNtYWxsDQo+IG9uZ29pbmcgbWFpbnRlbmFuY2UgLyByZXZpZXcgYnVyZGVuLCBzbyBJIHZv
dGUgbW92aW5nIHRoZSBmaWxlIHJhdGhlcg0KPiB0aGFuIGxlYXZpbmcgYSBwbGFjZSBob2xkZXIs
IGJ1dCBpdCdzIHVsdGltYXRlbHkgYW4geDg2IG1haW50YWluZXINCj4gY2FsbC4NCg0KSSB0aG91
Z2h0IHRoZSBwYXRjaCBrZXB0IHRoZSBvbGQgZmlsZSBhcyBhIHN0dWIgd2l0aCBqdXN0IG9uZSBs
aW5lOg0KDQojaW5jbHVkZSA8bGludXgveDg2L2ludGVsLWZhbWlseS5oPg0KDQp0byBncmFiIHRo
ZSByZWFsIGRhdGEgZnJvbSB0aGUgbmV3IGxvY2F0aW9uLiAgU28gdGhlIGluZm9ybWF0aW9uIGlz
bid0DQppbiB0d28gcGxhY2VzLg0KDQokIGdpdCBncmVwIC1sIGFzbS9pbnRlbC1mYW1pbHkuaCB8
IHdjIC1sDQo1Mw0KDQpEYW5nLiBXZSBzZWVtIHRvIGxvdmUgc3ByYXlpbmcgbW9kZWwgc3BlY2lm
aWMgY29kZSBhbGwgb3ZlciB0aGUgcGxhY2UgOi0oDQoNCk15IG9waW5pb24gaXMgdG8gcG9zdCBh
cyBJd29uYSB3cm90ZSBpdCAuLi4gYnV0IGJlIHByZXBhcmVkIGZvciB0aGUgbWFpbnRhaW5lcnMN
CnRvIHNheSAiSXQncyBvbmx5IDUzIGZpbGVzIC4uLiBqdXN0IGZpeCB0aGVtIGFsbCINCg0KLVRv
bnkNCg0K
