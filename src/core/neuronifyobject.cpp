#include "neuronifyobject.h"

NeuronifyObject::NeuronifyObject(QQuickItem *parent) : QQuickItem(parent)
{

}

void NeuronifyObject::addSavedPropertyGroup(PropertyGroup *propertyGroup)
{
    m_savedProperties.append(propertyGroup);
}

void NeuronifyObject::resetDynamics()
{
    for(NeuronifyObject* child : findChildren<NeuronifyObject*>()) {
        child->resetDynamics();
    }
    resetDynamicsEvent();
    emit resettedDynamics();
}

void NeuronifyObject::resetProperties()
{
    for(NeuronifyObject* child : findChildren<NeuronifyObject*>()) {
        child->resetProperties();
    }
    resetPropertiesEvent();
    emit resettedProperties();
}

void NeuronifyObject::resetDynamicsEvent()
{

}

void NeuronifyObject::resetPropertiesEvent()
{

}
