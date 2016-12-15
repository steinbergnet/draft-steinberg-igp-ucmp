---
title: Computing Unequal Cost Multipath (UCMP) Weights in Link-State IGP Protocols
abbrev: I-D
docname: draft-steinberg-igp-ucmp-00
date: 2016-12-15
ipr: trust200902
category: info
area: Routing
wg: Routing Area Working Group
kw: Internet-Draft

author:
  -
    ins: D. Steinberg
    name: Dirk Steinberg
    organization: Steinberg Consulting
    street: Ringstr. 2
    city: Buchholz
    code: D-53567
    country: Germany
    email: dws@steinbergnet.net
#   phone: +49-160-8551949 

pi: [toc, sortrefs, symrefs, compact, comments]

normative:
  RFC2119:
  ISO-10589:
    target: http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=30932
    title: Intermediate System to Intermediate System intra-domain routeing information exchange protocol for use in conjunction with the protocol for providing the connectionless-mode network service (ISO 8473)
    author:
      -
        ins: ISO
        name: ISO
        org: ISO
    date: 2002
    seriesinfo:
      "ISO": "International Standard 10589:2002, Second Edition"

informative:
  RFC5305:
  RFC3630:
  RFC1195:
  RFC2328:

--- abstract

Large service provider networks typically rely heavily on using
multiple parallel links and parallel path in the network topology to
achieve the desired bandwidth capacities and levels of redundancy. In
order to be able to use these multipath resources efficiently they
rely on Equal Cost Multipath (ECMP) routing in the underlying IGP
(ISIS or OSPF).

If these different paths through the network are not equal and
are of different bandwidth, ECMP will not deliver optimal load
distribution. In fact this may result in loss of traffic due to
overload on specific links even if the total available capacity would
be sufficient to carry all traffic without loss.

This memo proposed a method by which unequal weights can be computed
for these paths based on actual link bandwidth, changing the load
distribution mechanism of the routers from ECMP to Unequal Cost
Multipath (UCMP). This weight computation happens entirely based on
information available within the Link-State IGP without changing the
IGP behaviour itself, i.e. the path decision of the IGP (the chosen
set of multipath next-hops) is not modified, just the weigthing of the
paths. 

--- middle

# Introduction

Large service provider networks typically rely heavily on using
multiple parallel links and parallel path in the network topology to
achieve the desired bandwidth capacities and levels of redundancy. In
order to be able to use these multipath resources efficiently they
rely on Equal Cost Multipath (ECMP) routing in the underlying IGP
(ISIS or OSPF).

This works very well -- as long as the different paths are truly equal
from a bandwidth perspective -- because ECMP (as its name implies) is
designed for equal paths.  The problem occurs when the different
paths through the network are in fact not equal and are of different
bandwidth.

In this case ECMP will not deliver optimal load distribution. In fact
this may result in loss of traffic due to overload on specific links
even if the total available capacity would be sufficient to carry all
traffic without loss.

There can be many reasons why paths might not be equal, one or more
links in a bundle of links may have failed, or the physical rollout of
links in the network was simply not possible in exactly symmetrical
fashion due to economic or availability constraints. Emerging
technology for optical transmission might even dynamically alter the
actual transmission rate based on the properties of the optical
transmission channel (i.e. optical SNR). For example, an optical
transponder for 400 Gpbs might reduce the transmission rate to only
300 Gbps because optical protection rerouted the optical path along
a much longer path, forcing the transceiver to change to a different
encoding and/or FEC to compensate for the longer distance.

This memo proposed a method by which unequal weights can be computed
for these paths based on actual link bandwidth, changing the load
distribution mechanism of the routers from ECMP to Unequal Cost
Multipath (UCMP). This weight computation happens entirely based on
information available within the Link-State IGP without changing the
IGP behaviour itself, i.e. the path decision of the IGP (the chosen
set of multipath next-hops) is not modified, just the weigthing of the
paths. 


## Terminology

In this document, the key words "MUST", "MUST NOT", "REQUIRED",
"SHALL", "SHALL NOT", "SHOULD", "SHOULD NOT", "RECOMMENDED", "MAY",
and "OPTIONAL" are to be interpreted as described in BCP 14, RFC 2119
{{RFC2119}}.

# [ Insert content sections here ]

